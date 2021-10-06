class PostsController < ApplicationController
  #before_action :authenticate_user
  def index
    #@posts = Post.all
    @posts = Post.paginate(page: params[:page], per_page: 10)
   end

  def new
    @post = Post.new
   end

   def create
    @post =  Post.create(post_params)
    @post.user = current_user
    if @post.save
     redirect_to @post, notice: 'post was succesfully created'
    else
      render :new
    end 
   end

   def show
    @post = Post.find(params[:id])
  end

   def edit
    @post = Post.find(params[:id])
   end

   def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    #redirect_to root_path
    redirect_to posts_url, notice: 'Post was successfully destroyed.' 
  end

  private

  def post_params
    params.require(:post).permit(:conetent, :image, :title, :user_id, :avatar)
   end
end


