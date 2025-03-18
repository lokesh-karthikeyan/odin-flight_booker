class FlightsController < ApplicationController
  def index
    @locations = Airport.all.order(city: :asc).pluck(:city, :code)
    @passengers = [ *1..4 ]
    @dates = Flight.all.order(starts_at: :asc).map { |flight| flight.starts_at.strftime("%d-%m-%Y | %I:%M %p") }.uniq
    @available_flights = nil || Flight.find_flights(flight_params)
    @passenger_count = params[:passengers]
  end

  private

  def flight_params = params.permit(:departure, :destination, :date_and_time, :passengers)
end
