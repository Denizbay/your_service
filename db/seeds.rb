require 'faker'

fr = Language.create(name: 'french')
en = Language.create(name: 'english')
ger = Language.create(name: 'german')

md = Field.create(name: 'MD')
surgeon = Field.create(name: 'Surgeon')

names_for_surgeons = [
  "Dr. Stephan-Peter Hamm", "Dr. Susanne Lutz", "Dr. Christopher Marchand",
  "Dr. Michael Hoffmann", "Dr. Med Susanne Schroeder" "Dr. Med Susann Schumann"
]

names_for_surgeons_emails =





10.times do
  doctor = Doctor.create(
    name: names_for_surgeons.sample
    email:
    field: [md, surgeon].sample
    language: [fr, en, ger].sample
    description:



    DoctorLanguage.create(doctor: doctor, language: fr)
    10.times do
      Slot.create()
    end
  end



  puts 'Cleaning the database...'
  Doctor.destroy_all

  fake_attributes = [{},]


  Doctor.create!(fake_attributes)
  puts 'adding photos'
  puts "Done!"
