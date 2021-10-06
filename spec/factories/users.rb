require 'faker'

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.female_first_name }
    last_name { Faker::Name.last_name }
    email { "#{first_name}.#{last_name}@testuser.com".downcase }
    username { "#{first_name}_#{last_name}" }
    phone_number { "+5521972614293" }
    password { 123_456 }
  end
end
