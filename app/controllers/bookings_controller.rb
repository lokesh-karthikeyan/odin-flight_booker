class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight])
    @passenger_count = params[:passengers].to_i
    @booking = Booking.new
    @passenger_count.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      @booking.passengers.each { |passenger| PassengerMailer.with(booking_info: @booking, passenger: passenger).ticket_booked.deliver_now }
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
