class LikesController < ApplicationController
    
    def create
        @post= Post.find(params[:liked_post_id])
        current_user.likes.create!(liked_post_id: @post.id)
        respond_to do |format|
            format.html { redirect_to user_post_path(@post.author, @post) }
            format.js
        end
    end
    
    def destroy
        @like = Like.find(params[:id])
        @user = @like.liked_by_user
        @post = @like.liked_post
        @like.destroy
        respond_to do |format|
            format.html { redirect_to user_post_path(@post.author, @post) }
            format.js
        end
    end
end
