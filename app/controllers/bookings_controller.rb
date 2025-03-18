class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight])
    @passenger_count = params[:passengers].to_i
    @booking = Booking.new
    @passenger_count.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    Rails.logger.debug "ZZZZZ #{params}"
    if @booking.save
      redirect_to @booking, notice: "Booking was successful!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show = (@booking = Booking.find(params[:id]))

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [ :name, :email ])
  end
end
