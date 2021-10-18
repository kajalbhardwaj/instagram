class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    respond_to do |format|
      format.html
      format.pdf do
        render template: "posts/index.html.erb",
         pdf: "Posts: #{@posts.count}"
      end
    end
  end

  def search
    @query = params[:query]
    @posts = Post.where("posts.title LIKE ?",["%#{@query}%"])
    render :index
  end

  def new
    @post = Post.new
  end

  def create
    @post =  Post.create(post_params)
    @post.user = current_user
    if @post.save
      
      CatfactMailerJob.perform_later @post
      redirect_to @post, notice: 'post was succesfully created'
    else
      render :new
    end 
  end

  def show
    PostMailer.new_post.deliver_later
    respond_to do |format|
      format.html
      format.pdf do
        render template: "posts/show.html.erb",
          pdf: "Post ID: #{@post.id}"
      end
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.' 
  end
   
  def set_click
    if params[:click] == "true"
      @post = Post.find(params[:postId])
      @post.update(click: params[:click])
    end
  end

  def about
  end

  private

  def post_params
    params.require(:post).permit(:conetent, :title, :click, :user_id, :avatar)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end


