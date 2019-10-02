class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate, only: [:new, :create]
  

  def welcome
  render :welcome
  end

  def index
    @users = User.all
  end

  def show
    
    @user = current_user
    @feed_reservations = current_user.followees.flat_map { |followee_user| followee_user.latest_reservations }.sort_by{|reservation| reservation.reservation_time }.last(10).reverse
    @feed_reviews = current_user.followees.flat_map { |followee_user| followee_user.latest_reviews }.sort_by{|review| review.id }.last(10).reverse
  
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
    if @user.valid?
      @user.save
      redirect_to @user
      else
        flash[:error]
        render :new
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

  def feed
    @reservations = current_user.followees.flat_map { |followee_user| followee_user.latest_reservations }.sort_by{|reservation| reservation.reservation_time }.last(10).reverse
  end


  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password)
    end
end
