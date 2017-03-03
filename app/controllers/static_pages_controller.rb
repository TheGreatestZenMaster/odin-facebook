class StaticPagesController < ApplicationController

    def home
        @feed_items = current_user.feed.paginate(page: params[:page])
    end
    
    def help
    end
    
    def contact
    end
    
    def about
    end
end
