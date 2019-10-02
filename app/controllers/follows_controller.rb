class FollowsController < ApplicationController
  before_action :set_follow, only: [:show, :edit, :update, :destroy]


  def index
    @follows = Follow.all.select {|follow| follow.follower == current_user }
    
  end
 
  def show
  end

  def new
    @follow = Follow.new
    @user = current_user
  end

  def edit
  end

  def create
    @follow = Follow.new(follow_params)
    @follow.follower = current_user

    respond_to do |format|
      if @follow.save
        format.html { redirect_to @follow, notice: 'Follow was successfully created.' }
        format.json { render :show, status: :created, location: @follow }
      else
        format.html { render :new }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @follow.update(follow_params)
        format.html { redirect_to @follow, notice: 'Follow was successfully updated.' }
        format.json { render :show, status: :ok, location: @follow }
      else
        format.html { render :edit }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @follow.destroy
    respond_to do |format|
      format.html { redirect_to follows_url, notice: 'Follow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_follow
      @follow = Follow.find(params[:id])
    end

    def follow_params
      params.require(:follow).permit(:followee_id)
    end
end
