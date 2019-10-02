class ApplicationController < ActionController::Base
    before_action :authenticate
    helper_method :logged_in?
    helper_method :current_user
    def current_user
        @user = User.find_by(id: session[:user_id])
    end
    def logged_in?
        !!current_user
    end
    def authenticate
        if logged_in?
            current_user
        else
            flash[:error] = "You must be logged in first!"
            redirect_to login_path
        end
    end
 end