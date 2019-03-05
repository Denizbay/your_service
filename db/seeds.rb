require 'faker'

Slot.destroy_all
Doctor.destroy_all
DoctorLanguage.destroy_all
Language.destroy_all
Field.destroy_all

puts 'Creating Language'
fr = Language.create!(name: 'french')
en = Language.create!(name: 'english')
ger = Language.create!(name: 'german')

puts 'Creating Fields'
md = Field.create!(name: 'MD')
surgeon = Field.create!(name: 'Surgeon')




puts 'Creating Doctors'

50.times do
  surgeont_name = Faker::Name.name
  email_surgeont = Faker::Internet.email(surgeont_name)

  doctor = Doctor.create!(
    name: surgeont_name,
    email: email_surgeont,
    field: [md, surgeon].sample,
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus, laudantium.",
    address: Faker::Address.full_address
    )
  DoctorLanguage.create!(doctor: doctor, language: [fr, en, ger].sample)
  puts "Creating Slot for doctor #{surgeont_name}"
  50.times do
   slot =  Slot.create!(
      start_time: Faker::Time.forward(30, :morning),
      duration: 1,
      weekday: rand(1..5),
      week_number: Time.now.strftime("%U").to_i + rand(1..50),
      doctor: doctor
      )
  end
end



  # puts 'Cleaning the database...'
  # Doctor.destroy_all

  # fake_attributes = [{},]


  # Doctor.create!(fake_attributes)
  # puts 'adding photos'
  # puts "Done!"
