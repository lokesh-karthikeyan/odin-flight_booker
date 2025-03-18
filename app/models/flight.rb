class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  def self.find_flights(controller_params)
    if valid_controller_params?(controller_params)

      source = controller_params[:departure]
      target = controller_params[:destination]
      date, month, year = controller_params[:date_and_time].split.first.split("-")
      date_time = [ year, month, date ].join("-")

      source_airport = Airport.find_by(code: source)
      target_airport = Airport.find_by(code: target)
      flights = Flight.where(departure_airport: source_airport).where(arrival_airport: target_airport)
      flights.reject { |flight| flight.starts_at.to_s.split.first != date_time }
    end
  end

  def self.valid_controller_params?(controller_params)
    controller_params[:departure] && controller_params[:destination] && controller_params[:date_and_time]
  end

  private_class_method :valid_controller_params?
end
