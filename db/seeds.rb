unless Rails.env.production?
  puts "Cleaning database..."
  DatabaseCleaner.clean_with(:truncation)
end

puts "Creating user"
user = FactoryGirl.create(:user, email: "user@easy.com", password: "password")

puts "Creating 5 tickets"
5.times do
  FactoryGirl.create(:ticket, user: user)
end