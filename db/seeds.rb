require 'pry-byebug'
require 'open-uri'

# START
start_time = Time.now

# Parse JSON data 
file = "#{File.dirname(__FILE__)}/../app/assets/challenge_briefing/starter-code/data.json"
data = JSON.parse(File.read(file))

puts 'Creating shop data'
data.each do |product|
  # Create category
  category = Category.find_by(name: product['category'])
  if category.nil?
    category = Category.create!(name: product['category'])
  end
  # Create Product
  @product = Product.new(name: product['name'], category: category, new: product['new'] ,price: product['price'], description: product['description'], features: product['features'])
  # Create Pieces
  product_pieces = product['includes'].map do |piece|
    Piece.create!(name: piece['item'], amount: piece['quantity'])
  end
  # Associate pieces
  @product.pieces = product_pieces
  @product.save!
  puts @product.inspect
end

puts "#{Product.count} products created"
puts "***"
puts "#{Time.now - start_time} seconds elapsed"
puts "***"

# Estract filename from img url
def cloudinary_file_name(an_string)
  regex = /\w*-\w*\W*\d*.jpg$/
  an_string.match(regex)[0][0...-4]
end

def attach_product_photos(devices_hash, product)
  puts "Uploading photos to cloudinary"
  devices_hash.each do |device, main_image_path|
    # Upload photo to cloudinary
    public_id = "#{product.name.gsub(" ", "_")}_#{device}_#{cloudinary_file_name(main_image_path)}"
    uploaded_photo = Cloudinary::Uploader.upload("app/assets/challenge_briefing/starter-code/#{main_image_path}", { public_id: public_id })
    # Open cloudinary file
    file = URI.open(uploaded_photo['url'])
    # attach photo to product
    puts "attaching photo..."
    product.photos.attach(io: file, filename: uploaded_photo['public_id'], content_type: 'image/jpg')
  end
  puts "photos attached"
end


data.each_with_index do |product, index|
  # Get product
  @product = Product.find(product['id'])
  puts "Image seed for #{@product.name}"
  # Get main image path for all devices
  devices = product['image']
  # attach photos
  attach_product_photos(devices, @product)
  puts '************************'
  puts 'second round'
  product['gallery'].each do |_key, devices|
    attach_product_photos(devices, @product)
  end
end

puts "photos uploaded"
puts 'zo/'

puts 'creating users'
user_one = User.create!(username: 'basic', email: 'basic@user.com', first_name: 'Basic', last_name: 'User', phone_number: "+552197#{(1..9).to_a.sample(7)}", password: 123456)
puts user_one.username
puts user_one.admin
puts '*************'

user_two = User.create!(username: 'admin', email: 'dede@menezes.com', first_name: 'dede', last_name: 'menezes', phone_number: "+552197#{(1..9).to_a.sample(7)}", password: 123456, admin: true)
puts user_two.username
puts user_two.admin
puts '*************'
puts "Product count: #{Product.count}"
puts "User count: #{User.count}"

puts 'DONE!'
