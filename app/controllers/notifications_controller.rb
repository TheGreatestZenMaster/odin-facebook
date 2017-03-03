class NotificationsController < ApplicationController
    
    def show
      @notification = Notification.find(params[:id])
      if @notification.notifyable_type == "Like"
           @message = "Your post was liked!"
           @like = Like.find(@notification.notifyable_id)
      elsif @notification.notifyable_type == "Friendship"
            @message = "You have recieved a Friend request!"
            @friendship = Friendship.find(@notification.notifyable_id)
      end
        
        @from = User.find(@notification.notify_from_id)
    end
end
