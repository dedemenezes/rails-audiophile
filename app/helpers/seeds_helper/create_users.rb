module SeedsHelper
  module CreateUsers
    BASIC_USER = {
      username: 'basic',
      email: 'basic@user.com',
      first_name: 'Basic',
      last_name: 'User',
      phone_number: "+552197#{(1..9).to_a.sample(7)}",
      password: 123_456
    }
    ADMIN_USER = {
      username: 'admin',
      email: 'admin@user.com',
      first_name: 'Admin',
      last_name: 'User',
      phone_number: "+552197#{(1..9).to_a.sample(7)}",
      password: 123_456,
      admin: true
    }
    def self.test_users
      start_time = Time.now
      puts 'creating users'
      user_one = User.create!(BASIC_USER)
      puts user_one.username
      puts user_one.admin
      user_two = User.create!(ADMIN_USER)
      puts user_two.username
      puts user_two.admin
      puts "User count: #{User.count}"
      puts "#{Time.now - start_time} seconds"
    end
  end
end
