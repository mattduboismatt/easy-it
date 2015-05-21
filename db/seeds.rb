unless Rails.env.production?
  puts "Cleaning database..."
  DatabaseCleaner.clean_with(:truncation)
end

puts "Creating user"
user = FactoryGirl.create(:user, email: "user@easy.com", password: "password")

puts "Seeding services"
computers = Service.create(name: 'Computers')
home_theater = Service.create(name: 'Home Theater')
mobile = Service.create(name: 'Mobile')
portable = Service.create(name: 'Portable')
car_and_gps = Service.create(name: 'Car and GPS')
network_data = Service.create(name: 'Network Data')
smart_home = Service.create(name: 'Smart Home')
upcoming_technologies = Service.create(name: 'Upcoming Technologies')

puts "Seeding categories"
COMPUTERS = ['Computer Setup','Computer Tune-up','Data Backup or Transfer','Data Recovery','Email Setup','Hardware Install','Hardware Repair','Memory Install','Operating System Install','Printer Setup or Troubleshoot','Software Install & Setup','Technology Consultation','Training','Virus & Spyware Removal','Wireless Networking']
HOME_THEATER = ['Furniture Assembly','Gaming Setup','Home Theater Consultation','Home Theater Networking','Remote Control Setup','Speaker Install','TV and Video Setup','TV Calibration','TV Repair']
MOBILE = ['Device Setup','Device Repair','Hands-Free Install','iPod & MP3 Training','Mobile Broadband Setup','Mobile Email Setup','Shield Install','Tablet Setup']
CAR_AND_GPS = ['Car Amp Install','Car Speaker Install','Car Stereo Install','Car Technology Consultation','GPS Install','Hands-Free Phone Install','iPod & MP3 Install','Mobile Video Install']
NETWORK_DATA = ['Data Backup or Transfer','Data Recovery','Gaming Data Transfer','Home Theater Networking']
SMART_HOME =['Smart Camera Setup','Smart Hub Setup','Smart Lighting Setup','Smart Switch Setup','Smart Thermostat Setup','Home']
UPCOMING_TECHNOLOGIES=['Electronic Vehicle']

COMPUTERS.each { |cat| computers.categories << Category.create(name: cat) }
HOME_THEATER.each { |cat| home_theater.categories << Category.create(name: cat) }
MOBILE.each { |cat| mobile.categories << Category.create(name: cat) }
CAR_AND_GPS.each { |cat| car_and_gps.categories << Category.create(name: cat) }
NETWORK_DATA.each { |cat| network_data.categories << Category.create(name: cat) }
SMART_HOME.each { |cat| smart_home.categories << Category.create(name: cat) }
UPCOMING_TECHNOLOGIES.each { |cat| upcoming_technologies.categories << Category.create(name: cat) }

puts "Creating 5 tickets"
5.times do
  FactoryGirl.create(:ticket, user: user, category: Category.all.sample)
end