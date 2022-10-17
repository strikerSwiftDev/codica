# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
categories = [
  "Anatomical pathology",
  "Blood banking and transfusion medicine",
  "Chemical pathology",
  "Clinical pathology",
  "Cytopathology",
  "Forensic pathology",
  "Genetic pathology",
  "Hematology",
  "Immunopathology",
  "Medical microbiology",
  "Molecular pathology",
  "Neuropathology",
  "Pediatric pathology",
]
categories.each do |name|
  Category.create!(name: name)
end

Admin.create!(phone: Faker::PhoneNumber.cell_phone_in_e164, password: 'password', name: Faker::Name.name)

10.times do  Doctor.create!(phone: Faker::PhoneNumber.cell_phone_in_e164,
                            password: 'password',
                            category: Category.all.sample,
                            name: Faker::Name.name)
end
20.times do  Patient.create!(phone: Faker::PhoneNumber.cell_phone_in_e164,
                             password: 'password',
                             name: Faker::Name.name)
end

30.times { Appointment.create!(doctor: Doctor.all.sample, patient: Patient.all.sample, recomendation: Faker::Lorem.words)}
User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?