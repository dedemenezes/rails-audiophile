module SeedsHelper
  module CreateUsers
    def self.test_users
      start_time = Time.now
      puts 'creating users'
      user_one = User.create!(username: 'basic', email: 'basic@user.com', first_name: 'Basic', last_name: 'User', phone_number: "+552197#{(1..9).to_a.sample(7)}", password: 123456)
      puts user_one.username
      puts user_one.admin
  
      user_two = User.create!(username: 'admin', email: 'admin@user.com', first_name: 'Admin', last_name: 'User', phone_number: "+552197#{(1..9).to_a.sample(7)}", password: 123456, admin: true)
      puts user_two.username
      puts user_two.admin
      puts "User count: #{User.count}"
      puts "#{Time.now - start_time} seconds"
      puts '*************'
    end
  end
end
