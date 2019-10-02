class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  
  def index
    @user_reservations = Reservation.all.select { |reservation| reservation.user == current_user }.sort_by{ |reservation| reservation.reservation_time ? reservation.reservation_time : DateTime.now }.reverse
    
  end

  
  def show
   
  end

  def new
    @reservation = Reservation.new
  end

  def edit
  end


  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  



  private
    
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    
    def reservation_params
      params.require(:reservation).permit(:reservation_time, :num_of_guests, :restaurant_id, :occasion)
    end
end
