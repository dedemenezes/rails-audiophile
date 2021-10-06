require 'faker'
# # Returns a User instance that's not saved
# user = build(:user)

# # Returns a saved User instance
# user = create(:user)

# # Returns a hash of attributes that can be used to build a User instance
# attrs = attributes_for(:user)

# # Returns an object with all defined attributes stubbed out
# stub = build_stubbed(:user)

# # Passing a block to any of the methods above will yield the return object
# create(:user) do |user|
#   user.posts.create(attributes_for(:post))
# end

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.female_first_name }
    last_name { Faker::Name.last_name }
    email { "#{first_name}.#{last_name}@testuser.com".downcase }
    username { "#{first_name}_#{last_name}" }
    phone_number { "+5521972614293" }
    password { 123456 }
  end

  factory :piece do
    name { 'Speaker unit' }
    amount { 2 }
  end

  factory :category do
    name { "speakers" }
  end

  factory :product do
    name { "ZX9 Speaker" }
    price { 200 }
    description { "Upgrade your sound system with the all new ZX9 active speaker. It’s a bookshelf speaker system that offers truly wireless connectivity -- creating new possibilities for more pleasing and practical audio setups." }
    features { "Connect via Bluetooth or nearly any wired source. This speaker features optical, digital coaxial, USB Type-B, stereo RCA, and stereo XLR inputs, allowing you to have up to five wired source devices connected for easy switching. Improved bluetooth technology offers near lossless audio quality at up to 328ft (100m)." }
    association :category
  end
end