require 'faker'
require 'faker'
require "json"

file = File.read "db/address_clean.json"
data = JSON.parse(file)

female_pic = ["alice.jpg", "avalon.jpg", "celine.png","clarissa.jpg", "claire.jpeg", "clara.jpeg",
  "carly.jpeg", "diane.jpeg", "elise.jpeg", "emna.jpg", "irina.jpg", "ivy.jpeg", "jessica.png",
  "julia.jpeg", "juliakim.jpeg", "kirsty.png", "krisztina.jpg","laura.jpeg", "lea.png", "lonneke.jpeg",
   "louise.jpg", "madifa.png", "manon.jpeg", "margo.jpeg", "margarita.jpeg", "marina.jpg",
   "mathilde.jpg", "mirha.jpeg", "morgane.jpeg", "nathalia.jpg", "nina.jpeg", "orianne.jpeg",
   "olya.jpeg", "paphada.jpg", "rebecca.jpeg", "rebekah.jpg", "sharon.jpeg", "sarah.jpg",
   "serena.png", "sophie.jpeg", "tatiana.jpg", "yukari.jpg", "zuz.jpeg"]
male_pic = ["adrian.jpg", "andrey.jpeg", "andre.jpg", "arbi.jpeg", "aurel.jpg", "darrick.jpeg",
  "david.jpg", "diego.jpeg", "dimi.jpeg", "donatien.jpg", "emri.jpeg", "francois.jpeg", "frank.jpeg",
   "gianluca.png", "guillaume.jpg", "grant.jpg", "james.jpeg", "jason.jpg", "jerome.jpeg", "leon.jpeg",
   "lilian.jpeg", "loic.jpeg", "mahesh.jpeg", "martin.jpg", "max1.jpeg", "nino.jpeg", "nicolas.jpeg",
    "pierre.jpg", "reda.png", "sebastien.jpeg", "salim.jpeg", "sou.jpg", "suraj.jpg", "tim.jpg",
     "timothee.jpeg", "thomas.jpeg", "tom.png", "victor.jpeg", "vincent.jpeg", "wesley.jpg"]


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
  image: "koen2.jpeg",
  background: "desk_with_tree.jpg"
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
  language: ma
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
  image: "joost.jpeg",
  background: "pills_and_bottles.jpg"
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
  language: ma
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
      image: "deniz.jpeg",
      background: "show_on_laptop.jpg"
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
      image: "billy.jpg",
      background: "close_up_medical_equipment.jpg"
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
  language: fr
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
      image: "sebastian.jpg",
      background: "berghain.jpg"
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
  language: es
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

# -------------------------- DOCTOR 6 (female) -------------------------

doctor6 = Doctor.create(
  name: "Dr. Seema Pass",
  email: "seema_pass@doctor.com",
  field: Field.find_by(name: "General"),
  description: "Passionate about medicine",
  address: "Friedrichstraße 43, Berlin, Germany",
  image: "alice.jpg",
  background: "desk_with_tree.jpg"
  )

DoctorLanguage.create(
  doctor: doctor6,
  language: en
  )

DoctorLanguage.create(
  doctor: doctor6,
  language: fr
  )

DoctorLanguage.create(
  doctor: doctor6,
  language: ma
  )

20.times do
  start_time = (9..16).to_a.map { |hour| Time.new(0,1,1,hour)}.sample
  week_no = (10..11).to_a.sample
  week_day = rand(1..5)
  slot =  Slot.where(doctor: doctor6, start_time: start_time, week_number: week_no, weekday: week_day).first
  next if slot
  Slot.create(
      start_time: start_time,
      duration: 1,
      weekday: week_day,
      week_number: week_no,
      doctor: doctor6)
end

# -------------------------- DOCTOR 7 (female)  -------------------------

doctor7 = Doctor.create(
  name: "Dr. Annelies Holstra",
  email: "annelies_holstra@doctor.com",
  field: Field.find_by(name: "General"),
  description: "Patient care is what I live for",
  address: "Lindenstraße 9, Berlin, Germany",
  image: "carly.jpeg",
  background: "pills_and_bottles.jpg"
  )

DoctorLanguage.create(
  doctor: doctor7,
  language: en
  )

DoctorLanguage.create(
  doctor: doctor7,
  language: es
  )

DoctorLanguage.create(
  doctor: doctor7,
  language: ma
  )

20.times do
  start_time = (9..16).to_a.map { |hour| Time.new(0,1,1,hour)}.sample
  week_no = (10..11).to_a.sample
  week_day = rand(1..5)
  slot =  Slot.where(doctor: doctor7, start_time: start_time, week_number: week_no, weekday: week_day).first
  next if slot
  Slot.create(
      start_time: start_time,
      duration: 1,
      weekday: week_day,
      week_number: week_no,
      doctor: doctor7)
end

# -------------------------- DOCTOR 8 (female) -------------------------

doctor8 = Doctor.create(
      name: "Dr. Jordane Bentinck",
      email: "volkier_bentinck@doctor.com",
      field: Field.find_by(name: "Dermatology"),
      description: "Don't be ashamed....I have seen it all, well...almost all",
      address: "Niederkirchnerstraße 1, Berlin, Germany",
      image: "claire.jpeg",
      background: "show_on_laptop.jpg"
    )

DoctorLanguage.create(
  doctor: doctor8,
  language: en
  )

DoctorLanguage.create(
  doctor: doctor8,
  language: fr
  )

DoctorLanguage.create(
  doctor: doctor8,
  language: es
  )

20.times do
  start_time = (9..16).to_a.map { |hour| Time.new(0,1,1,hour)}.sample
  week_no = (10..11).to_a.sample
  week_day = rand(1..5)
  slot =  Slot.where(doctor: doctor8, start_time: start_time, week_number: week_no, weekday: week_day).first
  next if slot
  Slot.create(
      start_time: start_time,
      duration: 1,
      weekday: week_day,
      week_number: week_no,
      doctor: doctor3)
end

# -------------------------- DOCTOR 9 (female)  -------------------------

doctor9 = Doctor.create(
      name: "Dr. Caroline Gros",
      email: "caroline_gros@doctor.com",
      field: Field.find_by(name: "Dermatology"),
      description: "Here to help, here to care",
      address: "Schöneberger Str. 3, Berlin, Germany",
      image: "clarissa.jpg",
      background: "close_up_medical_equipment.jpg"
    )

DoctorLanguage.create(
  doctor: doctor9,
  language: en
  )

DoctorLanguage.create(
  doctor: doctor9,
  language: ma
  )

DoctorLanguage.create(
  doctor: doctor9,
  language: fr
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
      doctor: doctor9
      )
end

# -------------------------- DOCTOR 10 (female)  -------------------------

doctor10 = Doctor.create(
      name: "Dr. Nim Lepcha",
      email: "nim_lepcha@doctor.com",
      field: Field.find_by(name: "General"),
      description: "From Bruxelles....medicine capital of the world",
      address: "Charlottenstraße 49, Berlin, Germany",
      image: "nim.jpg",
      background: "berghain.jpg"
    )

DoctorLanguage.create(
  doctor: doctor10,
  language: en
  )

DoctorLanguage.create(
  doctor: doctor10,
  language: ma
  )

DoctorLanguage.create(
  doctor: doctor10,
  language: es
  )

20.times do
  start_time = (9..16).to_a.map { |hour| Time.new(0,1,1,hour)}.sample
  week_no = (10..11).to_a.sample
  week_day = rand(1..5)
  slot =  Slot.where(doctor: doctor10, start_time: start_time, week_number: week_no, weekday: week_day).first
  next if slot
  Slot.create(
      start_time: start_time,
      duration: 1,
      weekday: week_day,
      week_number: week_no,
      doctor: doctor10)
end


# -------------------------- FEMALE FAKER GENERATED DOCS ATTRIBUTES LANG SLOTS  -------------------------

Field.all.each do |field|
  10.times do
    actualpic = female_pic.last
    female_pic.pop
    puts "Create a doctor"
    doctor_first_name = Faker::Name.female_first_name
    doctor_last_name = Faker::Name.last_name
    doctor_full_name = doctor_first_name + " " + doctor_last_name
    email_doctor = Faker::Internet.email(doctor_full_name)
    doctor = Doctor.create!(
      name: "Dr. #{doctor_full_name}",
      email: email_doctor,
      field: field,
      description: Faker::Lorem.paragraph,
      address: data[count]["address"],
      image: actualpic
    )
    count += 1

    puts "Create the doctor language"
    Language.all.sample(rand(1..3)).each do |lang|
      DoctorLanguage.create!(doctor: doctor, language: lang)
    end

    puts "Creating Slot for doctor #{doctor_full_name}"
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
    actualpic = male_pic.last
    male_pic.pop
    puts "Create a doctor"
    doctor_first_name = Faker::Name.male_first_name
    doctor_last_name = Faker::Name.last_name
    doctor_full_name = doctor_first_name + " " + doctor_last_name
    email_doctor = Faker::Internet.email(doctor_full_name)
    doctor = Doctor.create!(
      name: "Dr. #{doctor_full_name}",
      email: email_doctor,
      field: field,
      description: Faker::Lorem.paragraph,
      address: data[count]["address"],
      image: actualpic
    )
    count += 1

    puts "Create the doctor language"
      Language.all.sample(rand(1..3)).each do |lang|
      DoctorLanguage.create!(doctor: doctor, language: lang)
    end

    puts "Creating Slot for doctor #{doctor_full_name}"
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
