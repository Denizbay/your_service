require 'faker'
require 'faker'
require "json"

file = File.read "db/address_clean.json"
data = JSON.parse(file)

female_pic = ["alice.jpg", "avalon.jpg", "claire.jpeg", "clara.jpeg", "diane.jpeg", "elise.jpeg",
  "emna.jpg", "irina.jpg", "kirsty.png", "laura.jpeg", "lonneke.jpeg", "louise.jpg", "manon.jpeg",
  "margo.jpeg", "morgane.jpeg", "rebekah.jpg", "sarah.jpg", "yukari.jpg", "zuz.jpeg"]
male_pic = ["adrian.jpg", "andrey.jpeg", "arbi.jpeg", "aurel.jpg", "david.jpg", "diego.jpeg", "dimi.jpeg", "emri.jpeg", "francois.jpeg", "gianluca.png",
  "jason.jpg", "leon.jpeg", "mahesh.jpeg", "martin.jpg", "max1.jpeg", "thomas.jpeg",
   "tom.png"]


DoctorLanguage.destroy_all
Review.destroy_all
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
de = Language.create!(name: 'German')


puts 'Creating Fields'
fields = ['Emergency Medicine', 'Psychiatry', 'General', 'Dermatology']
fields.each do |field|
  Field.create!(name: field)
end


puts 'Creating Doctors'

count = 0

# -------------------------- MANUALLY CREATED DOCS ATTRIBUTES LANG SLOTS  -------------------------

# -------------------------- DOCTOR 1  -------------------------

doctor1 = Doctor.create(
  name: "Dr. Koene Wille",
  email: "koen_wille@doctor.com",
  field: Field.find_by(name: "General"),
  description: "Have no fear, your doctor is here",
  address: "Pohlstrasse 70, Berlin, Germany",
  image: "koen.jpeg"
  )

DoctorLanguage.create(
  doctor: doctor1,
  language: en
  )

DoctorLanguage.create(
  doctor: doctor1,
  language: fr
  )

DoctorLanguage.create(
  doctor: doctor1,
  language: de
  )

20.times do
  start_time = (9..16).to_a.map { |hour| Time.new(0,1,1,hour)}.sample
  week_no = (10..11).to_a.sample
  week_day = rand(1..5)
  slot =  Slot.where(doctor: doctor1, start_time: start_time, week_number: week_no, weekday: week_day).first
  next if slot
  Slot.create(
      start_time: start_time,
      duration: 1,
      weekday: week_day,
      week_number: week_no,
      doctor: doctor1)
end

# -------------------------- DOCTOR 2  -------------------------

doctor2 = Doctor.create(
  name: "Dr. Joest Dyckerhoff",
  email: "joest_dyckerhoff@doctor.com",
  field: Field.find_by(name: "General"),
  description: "Over 20 experience across 3 continents allow me to give you the utmost professional medical advice and care",
  address: "Bergmannstrasse 91, Berlin, Germany",
  image: "joost.jpeg"
  )

DoctorLanguage.create(
  doctor: doctor2,
  language: en
  )

DoctorLanguage.create(
  doctor: doctor2,
  language: es
  )

DoctorLanguage.create(
  doctor: doctor2,
  language: de
  )

20.times do
  start_time = (9..16).to_a.map { |hour| Time.new(0,1,1,hour)}.sample
  week_no = (10..11).to_a.sample
  week_day = rand(1..5)
  slot =  Slot.where(doctor: doctor2, start_time: start_time, week_number: week_no, weekday: week_day).first
  next if slot
  Slot.create(
      start_time: start_time,
      duration: 1,
      weekday: week_day,
      week_number: week_no,
      doctor: doctor2)
end

# -------------------------- DOCTOR 3 -------------------------

doctor3 = Doctor.create(
      name: "Dr. Dennis Bayra",
      email: "dennis_bayra@doctor.com",
      field: Field.find_by(name: "Dermatology"),
      description: "Whether you have a rash or just gettting old...my humor and expertise will make you smile again",
      address: "Rudi-Dutschke-Straße 26, Berlin, Germany",
      image: "deniz.jpeg"
    )

DoctorLanguage.create(
  doctor: doctor3,
  language: en
  )

DoctorLanguage.create(
  doctor: doctor3,
  language: fr
  )

DoctorLanguage.create(
  doctor: doctor3,
  language: es
  )

20.times do
  start_time = (9..16).to_a.map { |hour| Time.new(0,1,1,hour)}.sample
  week_no = (10..11).to_a.sample
  week_day = rand(1..5)
  slot =  Slot.where(doctor: doctor3, start_time: start_time, week_number: week_no, weekday: week_day).first
  next if slot
  Slot.create(
      start_time: start_time,
      duration: 1,
      weekday: week_day,
      week_number: week_no,
      doctor: doctor3)
end

# -------------------------- DOCTOR 4  -------------------------

doctor4 = Doctor.create(
      name: "Dr. Billy Down",
      email: "billy_down@doctor.com",
      field: Field.find_by(name: "Dermatology"),
      description: "In my career I have seen it all and am happy to share that knowledge with you",
      address: "Lobeckstraße 36, Berlin, Germany",
      image: "billy.jpg"
    )

DoctorLanguage.create(
  doctor: doctor4,
  language: en
  )

DoctorLanguage.create(
  doctor: doctor4,
  language: ma
  )

DoctorLanguage.create(
  doctor: doctor4,
  language: de
  )

20.times do
  start_time = (9..16).to_a.map { |hour| Time.new(0,1,1,hour)}.sample
  week_no = (10..11).to_a.sample
  week_day = rand(1..5)
  slot =  Slot.where(doctor: doctor4, start_time: start_time, week_number: week_no, weekday: week_day).first
  next if slot
  Slot.create(
      start_time: start_time,
      duration: 1,
      weekday: week_day,
      week_number: week_no,
      doctor: doctor4
      )
end

# -------------------------- DOCTOR 5  -------------------------

doctor5 = Doctor.create(
      name: "Dr. Seb Saunier",
      email: "seb_saunier@doctor.com",
      field: Field.find_by(name: "General"),
      description: "Native ozzie, I moved to Berlin for medicine and techno",
      address: "Alt Moabit 93, Berlin, Germany",
      image: "sebastian.jpg"
    )

DoctorLanguage.create(
  doctor: doctor5,
  language: en
  )

DoctorLanguage.create(
  doctor: doctor5,
  language: ma
  )

DoctorLanguage.create(
  doctor: doctor5,
  language: de
  )

20.times do
  start_time = (9..16).to_a.map { |hour| Time.new(0,1,1,hour)}.sample
  week_no = (10..11).to_a.sample
  week_day = rand(1..5)
  slot =  Slot.where(doctor: doctor5, start_time: start_time, week_number: week_no, weekday: week_day).first
  next if slot
  Slot.create(
      start_time: start_time,
      duration: 1,
      weekday: week_day,
      week_number: week_no,
      doctor: doctor5)
end


# -------------------------- FEMALE FAKER GENERATED DOCS ATTRIBUTES LANG SLOTS  -------------------------

Field.all.each do |field|
  10.times do
    puts "Create a doctor"
    doctor_name = Faker::Name.female_first_name
    email_doctor = Faker::Internet.email(doctor_name)
    doctor = Doctor.create!(
      name: "Dr. #{doctor_name}",
      email: email_doctor,
      field: field,
      description: Faker::Lorem.paragraph,
      address: data[count]["address"],
      image: female_pic.sample
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

# -------------------------- MALE FAKER GENERATED DOCS ATTRIBUTES LANG SLOTS  -------------------------

Field.all.each do |field|
  10.times do
    puts "Create a doctor"
    doctor_name = Faker::Name.male_first_name
    email_doctor = Faker::Internet.email(doctor_name)
    doctor = Doctor.create!(
      name: "Dr. #{doctor_name}",
      email: email_doctor,
      field: field,
      description: Faker::Lorem.paragraph,
      address: data[count]["address"],
      image: male_pic.sample
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
