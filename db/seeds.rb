require 'faker'
require 'faker'
require "json"

file = File.read "db/address_clean.json"
data = JSON.parse(file)


DoctorLanguage.destroy_all
Booking.destroy_all
Slot.destroy_all
Doctor.destroy_all
Language.destroy_all
Field.destroy_all

# -------------------------- START POINT CREATINGS LANG FIELDS DOCS  -------------------------

puts 'Creating Language'
en = Language.create!(name: 'English')
es = Language.create!(name: 'Spanish')
ma = Language.create!(name: 'Mandarin')
fr = Language.create!(name: 'French')



puts 'Creating Fields'
fields = ['Emergency Medicine', 'Psychiatry', 'General', 'Dermatology']
fields.each do |field|
  Field.create!(name: field)
end


puts 'Creating Doctors'

count = 0

# -------------------------- FAKER GENERATED DOCS ATTRIBUTES LANG SLOTS  -------------------------

Field.all.each do |field|
  50.times do
    puts "Create a doctor"
    doctor_name = Faker::Name.name
    email_doctor = Faker::Internet.email(doctor_name)
    doctor = Doctor.create!(
      name: "Dr. #{doctor_name}",
      email: email_doctor,
      field: field,
      description: Faker::Lorem.paragraph,
      address: data[count]["address"]
    )
    count += 1

    puts "Create the doctor language"
    Language.all.sample(rand(1..3)).each do |lang|
      DoctorLanguage.create!(doctor: doctor, language: lang)
    end

    puts "Creating Slot for doctor #{doctor_name}"
    20.times do
      start_time = (9..16).to_a.map { |hour| Time.new(0,1,1,hour)}.sample
      week_no = (10..11).to_a.sample
      week_day = rand(1..5)
      slot =  Slot.where(doctor: doctor, start_time: start_time, week_number: week_no, weekday: week_day).first
      next if slot
      Slot.create(
        start_time: start_time,
        duration: 1,
        weekday: week_day,
        week_number: week_no,
        doctor: doctor
      )
    end
  end
end

# -------------------------- MANUALLY CREATED DOCS ATTRIBUTES LANG SLOTS  -------------------------

# -------------------------- DOCTOR 1  -------------------------

doctor_1 = Doctor.create(
  name: "Dr. Kn Wille",
  email: "koen_wille@doctor.com",
  field: "General",
  description: "Have no fear, your doctor is here",
  address: "Pohlstrasse 70, Berlin, Germany"
  )

DoctorLanguage.create(
  doctor: doctor_1,
  language: en
  )

DoctorLanguage.create(
  doctor: doctor_1,
  language: fr
  )

20.times do
  start_time = (9..16).to_a.map { |hour| Time.new(0,1,1,hour)}.sample
  week_no = (10..11).to_a.sample
  week_day = rand(1..5)
  slot =  Slot.where(doctor: doctor, start_time: start_time, week_number: week_no, weekday: week_day).first
  next if slot
  Slot.create(
      start_time: start_time,
      duration: 1,
      weekday: week_day,
      week_number: week_no,
      doctor: doctor_1)
end

# -------------------------- DOCTOR 2  -------------------------

doctor_2 = Doctor.create(
  name: "Dr. Joest Dyckerhoff",
  email: "joest_dyckerhoff@doctor.com",
  field: "General",
  description: "Over 20 experience across 3 continents allow me to give you the utmost professional medical advice and care",
  address: "Bergmannstrasse 91, Berlin, Germany",
  )

DoctorLanguage.create(
  doctor: doctor_2,
  language: en
  )

DoctorLanguage.create(
  doctor: doctor_2,
  language: es
  )

20.times do
  start_time = (9..16).to_a.map { |hour| Time.new(0,1,1,hour)}.sample
  week_no = (10..11).to_a.sample
  week_day = rand(1..5)
  slot =  Slot.where(doctor: doctor, start_time: start_time, week_number: week_no, weekday: week_day).first
  next if slot
  Slot.create(
      start_time: start_time,
      duration: 1,
      weekday: week_day,
      week_number: week_no,
      doctor: doctor_2)
end

# -------------------------- DOCTOR 3 -------------------------

doctor_3 = Doctor.create(
      name: "Dr. Dennis Bayra",
      email: "dennis_bayra@doctor.com",
      field: "Dermatology",
      description: "Whether you have a rash or just gettting old...my humor and expertise will make you smile again",
      address: "Rudi-Dutschke-Straße 26, Berlin, Germany"
    )

DoctorLanguage.create(
  doctor: doctor_3,
  language: en
  )

DoctorLanguage.create(
  doctor: doctor_3,
  language: fr
  )

DoctorLanguage.create(
  doctor: doctor_3,
  language: es
  )

20.times do
  start_time = (9..16).to_a.map { |hour| Time.new(0,1,1,hour)}.sample
  week_no = (10..11).to_a.sample
  week_day = rand(1..5)
  slot =  Slot.where(doctor: doctor, start_time: start_time, week_number: week_no, weekday: week_day).first
  next if slot
  Slot.create(
      start_time: start_time,
      duration: 1,
      weekday: week_day,
      week_number: week_no,
      doctor: doctor_3)
end

# -------------------------- DOCTOR 4  -------------------------

doctor_4 = Doctor.create(
      name: "Dr. Billy Down",
      email: "billy_down@doctor.com",
      field: "Dermatology",
      description: "In my career I have seen it all and am happy to share that knowledge with you",
      address: "Lobeckstraße 36",
      doctor_languages: "Mandarin", "English",
    )

DoctorLanguage.create(
  doctor: doctor_4,
  language: en
  )

DoctorLanguage.create(
  doctor: doctor_4,
  language: ma
  )

20.times do
  start_time = (9..16).to_a.map { |hour| Time.new(0,1,1,hour)}.sample
  week_no = (10..11).to_a.sample
  week_day = rand(1..5)
  slot =  Slot.where(doctor: doctor, start_time: start_time, week_number: week_no, weekday: week_day).first
  next if slot
  Slot.create(
      start_time: start_time,
      duration: 1,
      weekday: week_day,
      week_number: week_no,
      doctor: doctor_4)
end

# -------------------------- DOCTOR 5  -------------------------

doctor_5 = Doctor.create(
      name: "Dr. Dale Teoh",
      email: "dale_teoh@doctor.com",
      field: "General",
      description: "Native ozzie, I moved to Berlin for medicine and techno",
      address: "Alt Moabit 93, Berlin, Germany",
      doctor_languages: "Mandarin", "English",
    )

DoctorLanguage.create(
  doctor: doctor_5,
  language: en
  )

DoctorLanguage.create(
  doctor: doctor_5,
  language: ma
  )

20.times do
  start_time = (9..16).to_a.map { |hour| Time.new(0,1,1,hour)}.sample
  week_no = (10..11).to_a.sample
  week_day = rand(1..5)
  slot =  Slot.where(doctor: doctor, start_time: start_time, week_number: week_no, weekday: week_day).first
  next if slot
  Slot.create(
      start_time: start_time,
      duration: 1,
      weekday: week_day,
      week_number: week_no,
      doctor: doctor_5)
end
