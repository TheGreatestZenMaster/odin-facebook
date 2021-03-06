class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @users = User.all.paginate(page: params[:page])
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    def edit
    end
    
    def profile
        @user = User.find(params[:id])
    end
    
end
