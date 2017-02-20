class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_filter :store_action
  before_filter :configure_permitted_parameters, only: [:create]

  def store_action
    return unless request.get? 
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      store_location_for(:user, request.fullpath)
    end
  end
  
  protected
  
    def authenticate_user!
      if user_signed_in?
        super
      else
        redirect_to root_path
      end
    end
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end
end
