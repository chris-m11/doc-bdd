# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

10.times do |i| 
  city = City.create(city_name: Faker::Address.city)

  doctor = Doctor.create(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    #speciality: "Spec #{i}", 
    zip_code: Faker::Number.number(digits: 3),
    city: city
  )
  
  patient = Patient.create(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name,
    city: city
  )
  
  appointment = Appointment.create(
    date: Faker::Date.in_date_period, 
    doctor: doctor,patient: patient,
    city: city
  )

  specialty = Specialty.create(specialty_name: "Spec #{i}")

  doctor_specialty = DoctorSpecialty.create(doctor: doctor, specialty: specialty)

end
