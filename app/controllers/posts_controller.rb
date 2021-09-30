class PostsController < ApplicationController
    #before_action :authenticate_user
    def index
        @posts = Post.all
    end
    
    def new
        @post = Post.new
      end
    
    def create
        @post =  Post.create(post_params)
        if @post.save
         redirect_to @post
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
        @post = current_user.posts.find(params[:id])
        @post.destroy
        
        redirect_to user_path(current_user)
    end
    
    private
    
    def post_params
        params.require(:post).permit(:conetent, :title, :image, :user_id)
    end
end
 
 