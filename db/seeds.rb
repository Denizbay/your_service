require 'faker'
require 'faker'
require "json"

file = File.read "db/address_clean.json"
data = JSON.parse(file)


Slot.destroy_all
Doctor.destroy_all
DoctorLanguage.destroy_all
Language.destroy_all
Field.destroy_all

puts 'Creating Language'
en = Language.create!(name: 'English')
es = Language.create!(name: 'Spanish')
ma = Language.create!(name: 'Mandarin')
fr = Language.create!(name: 'French')



puts 'Creating Fields'
Andrology = Field.create!(name: 'Andrology')
Gynaecology = Field.create!(name: 'Gynaecology')
General = Field.create!(name: 'General')
Dermatology = Field.create!(name: 'Dermatology')






puts 'Creating Doctors'

count = 0

50.times do
  surgeont_name = Faker::Name.name
  email_surgeont = Faker::Internet.email(surgeont_name)

  doctor = Doctor.create!(
    name: surgeont_name,
    email: email_surgeont,
    field: [Andrology, Gynaecology, General, Dermatology].sample,
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus, laudantium.",
    address: data[count]["address"]
    )
  DoctorLanguage.create!(doctor: doctor, language: [en, es, ma, fr].sample)
  puts "Creating Slot for doctor #{surgeont_name}"
  200.times do
    start_time = (9..18).to_a.map { |hour| Time.new(0,1,1,hour)}.sample
    week_no = (10..20).to_a.sample
    slot =  Slot.where(doctor: doctor, start_time: start_time, week_number: week_no).first
    next if slot
    Slot.create!(
      start_time: start_time,
      duration: 1,
      weekday: rand(1..5),
      week_number: week_no,
      doctor: doctor
      )
  end
  count +=1
end




# [{"id":323763,"name":"\"Unsere Gute Stube\" Nachbarschaftscafe","address":"Reinickendorfer Stra\u00dfe 59, Berlin, Germany","category":"restaurant","location":"Berlin","lat":52.556629,"lng":13.365949,"details":"http:\/\/tour-pedia.org\/api\/getPlaceDetails?id=323763"},{"id":324004,"name":"Adnan Caliskan Musikcafe","address":"Jungfernheideweg 11, Berlin, Germany","category":"restaurant","location":"Berlin","lat":52.538149,"lng":13.27201,"details":"http:\/\/tour-pedia.org\/api\/getPlaceDetails?id=324004"},{"id":331204,"name":"Aliriza Yildiz B\u00e4ckerei und Eiscafe","address":"Alt-Stralau 60, Berlin, Germany","category":"restaurant","location":"Berlin","lat":52.495558,"lng":13.468221,"numReviews":1,"reviews":"http:\/\/tour-pedia.org\/api\/getReviewsByPlaceId?placeId=331204","polarity":0,"details":"http:\/\/tour-pedia.org\/api\/getPlaceDetails?id=331204"},{"address":"Krossener Str. 35","category":"restaurant","id":93280,"lat":52.509335,"lng":13.464107,"location":"Berlin","name":"Amitola Familiencafe","originalId":"4b2df4b1f964a52035dc24e3","polarity":3,"subCategory":"Caf\u00e9","numReviews":2,"reviews":"http:\/\/tour-pedia.org\/api\/getReviewsByPlaceId?placeId=93280","details":"http:\/\/tour-pedia.org\/api\/getPlaceDetails?id=93280"},{"id":326711,"name":"Billardcafe Cafebar Nord","address":"Bucher Chaussee 3, Berlin, Germany","category":"restaurant","location":"Berlin","lat":52.631106,"lng":13.51988,"details":"http:\/\/tour-pedia.org\/api\/getPlaceDetails?id=326711"},{"address":"Tempelhofer Damm 104","category":"restaurant","id":105220,"lat":52.47092149425,"lng":13.385276596663,"location":"Berlin","name":"Blue Eiscafe","originalId":"4fb9084ae4b07bf810cff605","polarity":0,"subCategory":"Ice Cream Shop","details":"http:\/\/tour-pedia.org\/api\/getPlaceDetails?id=105220"},{"address":"U-Bhf Rathaus Steglitz","category":"restaurant","id":108218,"lat":52.455256307468,"lng":13.322282481242,"location":"Berlin","name":"Boulangerie et cafe francais","originalId":"509a1c81e4b0d11ca740f66d","polarity":0,"subCategory":"Bakery","details":"http:\/\/tour-pedia.org\/api\/getPlaceDetails?id=108218"},{"address":"","category":"restaurant","id":106366,"lat":52.511399,"lng":13.199207,"location":"Berlin","name":"B\u00e4ckerei Stehcafe","originalId":"500be2aae4b01145793b6fb3","polarity":0,"subCategory":"Bakery","details":"http:\/\/tour-pedia.org\/api\/getPlaceDetails?id=106366"},{"address":"Pariser Str. 42","category":"restaurant","id":108791,"lat":52.498274115709,"lng":13.31914378702,"location":"Berlin","name":"CUT! Moviecafe","originalId":"50d30355e4b0ec5728da27b6","polarity":0,"subCategory":"American Restaurant","numReviews":2,"reviews":"http:\/\/tour-pedia.org\/api\/getReviewsByPlaceId?placeId=108791","details":"http:\/\/tour-pedia.org\/api\/getPlaceDetails?id=108791"},{"id":220877,"name":"Cafe bugatti - Musikcafe, Cocktailbar, Billard & Dart","address":"Seeburgerstra\u00dfe 8, Berlin, 13581, Germany","category":"restaurant","location":"Berlin","lat":52.5288437076,"lng":13.1926225698,"numReviews":1,"reviews":"http:\/\/tour-pedia.org\/api\/getReviewsByPlaceId?placeId=220877","polarity":0,"details":"http:\/\/tour-pedia.org\/api\/getPlaceDetails?id=220877"},{"id":323470,"name":"Casa Mia Eiscafe Und Salumeria","address":"Hertzstra\u00dfe 12, Berlin, Germany","category":"restaurant","location":"Berlin","lat":52.584884,"lng":13.366622,"details":"http:\/\/tour-pedia.org\/api\/getPlaceDetails?id=323470"},{"id":326003,"name":"Centolire cafe e panini","address":"Leipziger Stra\u00dfe 128, Berlin, Germany","category":"restaurant","location":"Berlin","lat":52.509964,"lng":13.382073,"numReviews":1,"reviews":"http:\/\/tour-pedia.org\/api\/getReviewsByPlaceId?placeId=326003","polarity":10,"details":"http:\/\/tour-pedia.org\/api\/getPlaceDetails?id=326003"},{"address":"","category":"restaurant","id":114317,"lat":52.51749,"lng":13.59102,"location":"Berlin","name":"Das feinkost back cafe","originalId":"5270b2c311d29309d2dca1fb","polarity":0,"subCategory":"Bakery","details":"http:\/\/tour-pedia.org\/api\/getPlaceDetails?id=114317"},{"id":220827,"name":"Das kleine Gartencafe","address":"Marie-Elisabeth-von-Humboldt-Stra\u00dfe 70, Berlin, Germany","category":"restaurant","location":"Berlin","lat":52.574633,"lng":13.557943,"details":"http:\/\/tour-pedia.org\/api\/getPlaceDetails?id=220827"},{"id":330244,"name":"Devran cafe \/ Bistro","address":"Feurigstra\u00dfe 39, Berlin sch\u00f6neberg, Deutschland","category":"restaurant","location":"Berlin","lat":52.481497,"lng":13.350193,"details":"http:\/\/tour-pedia.org\/api\/getPlaceDetails?id=330244"},{"id":325900,"name":"Dieter Wollstein Newscafe Gastst\u00e4tten GmbH","address":"Unter den Linden 42, Berlin, Germany","category":"restaurant","location":"Berlin","lat":52.517115,"lng":13.38606,"details":"http:\/\/tour-pedia.org\/api\/getPlaceDetails?id=325900"},{"id":327399,"name":"Drinkbar Sp\u00e4tkauf Telecafe und Internet","address":"Rigaer Stra\u00dfe 27, Berlin, Germany","category":"restaurant","location":"Berlin","lat":52.516789,"lng":13.462359,"details":"http:\/\/tour-pedia.org\/api\/getPlaceDetails?id=327399"},{"id":331645,"name":"Eiscafe","address":"D\u00f6nhoffstra\u00dfe 7, Berlin, Germany","category":"restaurant","location":"Berlin","lat":52.483443,"lng":13.522692,"details":"http:\/\/tour-pedia.org\/api\/getPlaceDetails?id=331645"},{"id":99580,"name":"Eiscafe \"Fantasia del Gelato\"","address":"Wilmersdorfer Stra\u00dfe 46, Berlin, Germany","category":"restaurant","location":"Berlin","lat":52.509761,"lng":13.305543,"numReviews":1,"reviews":"http:\/\/tour-pedia.org\/api\/getReviewsByPlaceId?placeId=99580","polarity":0,"details":"http:\/\/tour-pedia.org\/api\/getPlaceDetails?id=99580"},{"address":"Gropius Passagen","category":"restaurant","id":100344,"lat":52.428825123511,"lng":13.453819341825,"location":"Berlin","name":"Eiscafe & Pizza di Russilo","originalId":"4e2724a1c65bb6120fd2c2d3","polarity":0,"subCategory":"Caf\u00e9","details":"http:\/\/tour-pedia.org\/api\/getPlaceDetails?id=100344"},{"id":331820,"name":"Eiscafe Alteatro","address":"Johannisthaler Chaussee 307, Berlin, Germany","category":"restaurant","location":"Berlin","lat":52.43005,"lng":13.45761,"details":"http:\/\/tour-pedia.org\/api\/getPlaceDetails?id=331820"},{"address":"","category":"restaurant","id":100303,"lat":52.466159385804,"lng":13.385642358205,"location":"Berlin","name":"Eiscafe Bali","originalId":"4e22ff00628469a574257b2e","polarity":0,"subCategory":"Caf\u00e9","details":"http:\/\/tour-pedia.org\/api\/getPlaceDetails?id=100303"},{"id":329759,"name":"Eiscafe Cakmak","address":"Wilhelmstra\u00dfe 10, Berlin, Germany","category":"restaurant","location":"Berlin","lat":52.501971,"lng":13.388547,"details":"http:\/\/tour-pedia.org\/api\/getPlaceDetails?id=329759"},{"address":"Rathaus-Center Pankow","category":"restaurant","id":108418,"lat":52.569627382247,"lng":13.403661310516,"location":"Berlin","name":"Eiscafe Capriccio","originalId":"50ae2fade4b0441cd7d3112a","polarity":0,"subCategory":"Ice Cream Shop","numReviews":1,"reviews":"http:\/\/tour-pedia.org\/api\/getReviewsByPlaceId?placeId=108418","details":"http:\/\/tour-pedia.org\/api\/getPlaceDetails?id=108418"},{"id":328172,"name":"Eiscafe Carrucci","address":"Clayallee 343, Berlin, Germany","category":"restaurant","location":"Berlin","lat":52.436577,"lng":13.261097,"details":"http:\/\/tour-pedia.org\/api\/getPlaceDetails?id=328172"},{"id":220935,"name":"Eiscafe EISKIMO","address":"Curtiusstra\u00dfe 8, Berlin, 12205, Germany","category":"restaurant","location":"Berlin","lat":52.442520782936,"lng":13.295164315008,"numReviews":8,"reviews":"http:\/\/tour-pedia.org\/api\/getReviewsByPlaceId?placeId=220935","polarity":1,"details":"http:\/\/tour-pedia.org\/api\/getPlaceDetails?id=220935"},{"id":325046,"name":"Eiscafe Eisberg","address":"Brunnenstra\u00dfe 55, Berlin, Germany","category":"restaurant","location":"Berlin","lat":52.539075,"lng":13.395904,"numReviews":1,"reviews":"http:\/\/tour-pedia.org\/api\/getReviewsByPlaceId?placeId=325046","polarity":0,"details":"http:\/\/tour-pedia.org\/api\/getPlaceDetails?id=325046"},{"address":"Sakrower Kirchweg 1-3","category":"restaurant","id":98633,"lat":52.452514816748,"lng":13.144755729155,"location":"Berlin","name":"Eiscafe Eiskrem","originalId":"4da023f2e8a6721e080c31a5","polarity":0,"subCategory":&...


  # puts 'Cleaning the database...'
  # Doctor.destroy_all

  # fake_attributes = [{},]


  # Doctor.create!(fake_attributes)
  # puts 'adding photos'
  # puts "Done!"
