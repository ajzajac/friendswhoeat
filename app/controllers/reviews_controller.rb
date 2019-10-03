class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]

  
  def index
    @user_reviews = Review.all.select { |review| review.user == current_user }.sort_by{ |review| review.created_at }.reverse
    
  end


  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = Review.all.select { |review| review.restaurant == @restaurant}
  end

  
  def new
    @review = Review.new
  end

  
  def edit
  end

  
  def create
    @review = Review.new(review_params)
    @review.user = current_user
    respond_to do |format|
      if @review.save
        format.html { redirect_to user_path(@review.user), notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to user_path(@user), notice: 'Review was successfully updated.' }
        
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
   
    def set_review
    
      @review = Review.find(params[:id])
    end

    
    def review_params
      params.require(:review).permit(:description, :rating, :restaurant_id, :user_id)
    end
end
