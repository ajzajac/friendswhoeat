class SessionsController < ApplicationController
    skip_before_action :authenticate, only: [:new, :create, :destroy]
   
    def new
        render :new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate( params[:user][:password])
            session[:user_id] = @user.id
            redirect_to "/"
        else
            flash[:error] = "Email or password is invalid"
            redirect_to login_path
        end
    end
    
    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end
 end