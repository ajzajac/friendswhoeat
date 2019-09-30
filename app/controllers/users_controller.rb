class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # def authenticate
  #   @user = User.find_by(email: params[:user][:email])

  #   if @user.authenticate(params[:user][:password])
  #     session = @user.id
  #     redirect_to @user.id
  #   else
  #     flash[:error] = "Incorrect username or password"
  #     redirect_to login_path
  #   end
  # end

  def index
    @users = User.all
  end

  def show
    current_user = User.find_by(id: session[:user_id])
    if @user
      render :show
    else
      redirect_to login_path
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password_digest)
    end
end
