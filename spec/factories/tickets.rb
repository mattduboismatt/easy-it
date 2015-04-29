FactoryGirl.define do
  factory :ticket do
    title { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    user
  end
end
