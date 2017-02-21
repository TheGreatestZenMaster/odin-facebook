class CommentsController < ApplicationController
    
    def new
        @comment = Comment.new
    end
    
    def create
        @post = Post.find(params[:post_id])
        @user = User.find(@post.author_id)
        @comment = @post.comments.create!(comment_params.merge(author: current_user))
        redirect_to user_post_path(@user, @post)
    end
    
    private
        def comment_params
           params.require(:comment).permit(:content)
        end
end
