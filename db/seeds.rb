puts "Cleaning database..."

Doctor.destroy_all
User.destroy_all

puts "Creating users..."
User.create!(email: "carlosramirez@medhora.com", pasword: "123456")
User.create!(email: "anatorres@medhora.com", pasword: "123456")

puts "Creating doctors..."

Doctor.create!(
  first_name: "Carlos",
  last_name: "Ramirez",
  photo_url: "https://via.placeholder.com/150",
  specialty: "Cardiology",
  license_number: "MED001",
  consultation_price: 500,
  available: true,
  user: User.find_by(email: "carlosramirez@medhora.com"),
)

Doctor.create!(
  first_name: "Ana",
  last_name: "Torres",
  photo_url: "https://via.placeholder.com/150",
  specialty: "Dermatology",
  license_number: "MED002",
  consultation_price: 700,
  available: true,
  user: User.find_by(email: "anatorres@medhora.com"),
)

puts "Done! Created #{Doctor.count} doctors."
