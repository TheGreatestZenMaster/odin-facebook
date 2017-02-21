class PostsController < ApplicationController
    
    def new
        @user = current_user
        @post = Post.new
    end
    
    def create
        @user = current_user
        @post = @user.posts.create!(post_params)
        flash[:sucess] = "Post created!"
        redirect_to user_post_path(@user, @post)
    end
    
    def show
        @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:id])
    end
    
    def index
        @user = User.find(params[:user_id])
        @posts = @user.posts.all
    end
    
    
    private
        def post_params
           params.require(:post).permit(:content) 
        end
end 
