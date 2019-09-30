# class SessionsController < ApplicationController

#     def new
#         render :new
#     end

#     def create
#         @user = User.find_by(email: params[:user][:email])

#         if @user && @user.authenticate(params[:user][:password])
#             session[:user_id] = @user.id
#             redirect_to user_path(@user)
#         else
#             flash[:error] = "Invalid email/password combo"
#             redirect_to login_path
#         end
#     end
# end