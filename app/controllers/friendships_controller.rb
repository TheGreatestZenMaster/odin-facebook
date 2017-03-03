class FriendshipsController < ApplicationController
    def create
        @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
        if @friendship.save
            flash[:notice] = "Added friend."
            @friendship.create_notification!(notify_from_id: current_user.id, notify_id: @friendship.friend_id)
            redirect_to root_url
        else
            flash[:error] = "Unable to add friend."
            redirect_to root_url
        end
    end
    
    def index
        @user = User.find(params[:user_id])
    end
        
    def update
        @friendship = current_user.inverse_friendships.find(params[:id])
        if params[:button_action] == "accept"
            accept_friend_request(@friendship)
            flash[:notice] = "Friendship Accepted!"
            redirect_to root_url
        else
           @friendship.destroy
        end
    end
    
    def destroy
        @friendship = current_user.friendships.find(params[:id])
        @friendship.destroy
        flash[:notice] = "Removed friendship."
        redirect_to current_user
    end
    
    
    private
        def accept_friend_request(friendship)
            friendship.accepted = true
            friendship.notification.destroy
            friendship.save
        end
end
