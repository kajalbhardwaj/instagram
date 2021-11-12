class RelationshipsController < ApplicationController
    def create
        @user = User.find(params[:user_id])
        @relationship = Relationship.new(follower_id: current_user.id, followed_id: @user.id)
        @relationship.save
        redirect_to user_path(@user)
    end
       def destroy
          @relationship = Relationship.find(params[:id])
          @relationship.destroy
          redirect_to user_path(@relationship.followed_id)
       end
end
