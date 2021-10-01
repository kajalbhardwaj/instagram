class LikesController < ApplicationController
    def create
        @like = current_user.likes.new(like_params)
        if !@like.save
            flah[:notice] = @like.errors.full_message.to_sentence
        end
          redirect_to @like.post
    end

    def destroy
        @like = current_user.likes.find(params[:id])
        post = @like.post
        @like.destroy
        redirect_to post
    end
    private
    def likes_params
        param.require(:like).permit(:post_id)
    end

end
