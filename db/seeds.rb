unless Rails.env.production?
  puts "Cleaning database..."
  DatabaseCleaner.clean_with(:truncation)
end

puts "Creating user"
user = FactoryGirl.create(:user, email: "user@easy.com", password: "password")

puts "Seeding top categories"
computers = Category.create!(name: 'Computers')
home_theater = Category.create!(name: 'Home Theater')
mobile = Category.create!(name: 'Mobile')
portable = Category.create!(name: 'Portable')
car_and_gps = Category.create!(name: 'Car and GPS')
network_data = Category.create!(name: 'Network Data')
smart_home = Category.create!(name: 'Smart Home')
upcoming_technologies = Category.create!(name: 'Upcoming Technologies')

puts "Seeding sub categories"
COMPUTERS = ['Computer Setup','Computer Tune-up','Data Backup or Transfer','Data Recovery','Email Setup','Hardware Install','Hardware Repair','Memory Install','Operating System Install','Printer Setup or Troubleshoot','Software Install & Setup','Technology Consultation','Training','Virus & Spyware Removal','Wireless Networking']
HOME_THEATER = ['Furniture Assembly','Gaming Setup','Home Theater Consultation','Home Theater Networking','Remote Control Setup','Speaker Install','TV and Video Setup','TV Calibration','TV Repair']
MOBILE = ['Device Setup','Device Repair','Hands-Free Install','iPod & MP3 Training','Mobile Broadband Setup','Mobile Email Setup','Shield Install','Tablet Setup']
PORTABLE = ['Device Setup','Device Repair','Hands-Free Install','iPod & MP3 Training','Mobile Broadband Setup','Mobile Email Setup','Shield Install','Tablet Setup']
CAR_AND_GPS = ['Car Amp Install','Car Speaker Install','Car Stereo Install','Car Technology Consultation','GPS Install','Hands-Free Phone Install','iPod & MP3 Install','Mobile Video Install']
NETWORK_DATA = ['Data Backup or Transfer','Data Recovery','Gaming Data Transfer','Home Theater Networking']
SMART_HOME =['Smart Camera Setup','Smart Hub Setup','Smart Lighting Setup','Smart Switch Setup','Smart Thermostat Setup','Home']
UPCOMING_TECHNOLOGIES=['Electronic Vehicle']

COMPUTERS.each { |sub| computers.children.create!(name: sub) }
HOME_THEATER.each { |sub| home_theater.children.create!(name: sub) }
MOBILE.each { |sub| mobile.children.create!(name: sub) }
PORTABLE.each { |sub| portable.children.create!(name: sub) }
CAR_AND_GPS.each { |sub| car_and_gps.children.create!(name: sub) }
NETWORK_DATA.each { |sub| network_data.children.create!(name: sub) }
SMART_HOME.each { |sub| smart_home.children.create!(name: sub) }
UPCOMING_TECHNOLOGIES.each { |sub| upcoming_technologies.children.create!(name: sub) }

puts "Creating 5 tickets"
5.times do
  FactoryGirl.create(:ticket, user: user, category: Category.subs.sample)
end