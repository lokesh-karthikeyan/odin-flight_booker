# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Airport.create([
  { code: "MAA", city: "Chennai" },
  { code: "CJB", city: "Coimbatore" },
  { code: "TRZ", city: "Tiruchirappalli" },
  { code: "IXM", city: "Madurai" },
  { code: "DEL", city: "Delhi" },
  { code: "BOM", city: "Mumbai" },
  { code: "BLR", city: "Bengaluru" },
  { code: "HYD", city: "Hyderabad" },
  { code: "COK", city: "Kochi" },
  { code: "GOI", city: "Dabolim, Goa" }
])

Flight.create([
  { departure_airport: Airport.find_by(code: "MAA"), arrival_airport: Airport.find_by(code: "CJB"), starts_at: Time.now + 1.day, duration: 300 },
  { departure_airport: Airport.find_by(code: "TRZ"), arrival_airport: Airport.find_by(code: "GOI"), starts_at: Time.now + 2.day, duration: 320 },
  { departure_airport: Airport.find_by(code: "IXM"), arrival_airport: Airport.find_by(code: "BOM"), starts_at: Time.now + 3.day, duration: 200 },
  { departure_airport: Airport.find_by(code: "DEL"), arrival_airport: Airport.find_by(code: "MAA"), starts_at: Time.now + 1.day, duration: 350 },
  { departure_airport: Airport.find_by(code: "BOM"), arrival_airport: Airport.find_by(code: "BLR"), starts_at: Time.now + 5.day, duration: 360 },
  { departure_airport: Airport.find_by(code: "BLR"), arrival_airport: Airport.find_by(code: "TRZ"), starts_at: Time.now + 11.day, duration: 400 },
  { departure_airport: Airport.find_by(code: "HYD"), arrival_airport: Airport.find_by(code: "COK"), starts_at: Time.now + 5.day, duration: 120 },
  { departure_airport: Airport.find_by(code: "COK"), arrival_airport: Airport.find_by(code: "GOI"), starts_at: Time.now + 1.day, duration: 300 },
  { departure_airport: Airport.find_by(code: "COK"), arrival_airport: Airport.find_by(code: "MAA"), starts_at: Time.now + 3.day, duration: 320 },
  { departure_airport: Airport.find_by(code: "MAA"), arrival_airport: Airport.find_by(code: "CJB"), starts_at: Time.now + 4.day, duration: 340 }
])
