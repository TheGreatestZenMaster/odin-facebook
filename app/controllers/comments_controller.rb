class CommentsController < ApplicationController
    
    def new
        @comment = Comment.new
    end
    
    def create
        @post = Post.find(params[:post_id])
        @user = User.find(@post.author_id)
        @comment = @post.comments.new(comment_params.merge(author: current_user))
        if @comment.save
            redirect_to user_post_path(@user, @post)
        else
            @comment.destroy
            flash[:warning] = flash_error_message(@comment)
            redirect_to user_post_path(@user, @post)
        end
    end
    
    
    def flash_error_message(arg)
        "The form contains #{arg.errors.count} error: #{arg.errors.full_messages.join(', ')}"       
    end
    
    private
        def comment_params
           params.require(:comment).permit(:content)
        end
end
