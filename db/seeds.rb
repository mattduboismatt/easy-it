unless Rails.env.production?
  puts "Cleaning database..."
  DatabaseCleaner.clean_with(:truncation)
end

puts "Creating user"
FactoryGirl.create(:user, email: "me@foo.bar", password: "password")
