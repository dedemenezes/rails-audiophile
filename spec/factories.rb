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
    first_name { "Basic" }
    last_name { "User" }
    email { "#{first_name}.#{last_name}@testuser.com".downcase }
    username { "#{first_name}_#{last_name}" }
    phone_number { "+5521972614293" }
    password { 123456 }
  end
end