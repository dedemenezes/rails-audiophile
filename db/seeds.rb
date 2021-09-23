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
  @product = Product.new(name: product['name'], category: category, new: product['new'] ,price: product['price'], description: product['description'], features: product['features'])
  product_pieces = product['includes'].map do |piece|
    Piece.create!(name: piece['item'], amount: piece['quantity'])
  end
  @product.pieces = product_pieces
  @product.save!

  puts @product.inspect
end

puts "#{Product.count} products created"
puts "***"
puts "#{Time.now - start_time} seconds elapsed"
puts "***"
def cloudinary_file_name(an_string)
  regex = /\w*-\w*\W*\d*.jpg$/
  an_string.match(regex)[0][0...-4]
end

def attach_product_photos(devices_array, product)
  puts "Uploading photos to cloudinary"
  devices_array.each do |device, main_image_path|
    # Upload photo to cloudinary
    uploaded_photo = Cloudinary::Uploader.upload("app/assets/challenge_briefing/starter-code/#{main_image_path}", { public_id: device + '_' + cloudinary_file_name(main_image_path)})
    # Open cloudinary file
    file = URI.open(uploaded_photo['url'])
    # attach photo to product
    puts "attaching photo..."
    product.photos.attach(io: file, filename: uploaded_photo['public_id'], content_type: 'image/jpg')
  end
  puts "photos attached"
end


data.each_with_index do |product, index|
  # ./assets/product-yx1-earphones/desktop/image-product.jpg
  # Get product
  @product = Product.find(product['id'])
  puts "Image seed for #{@product.name}"
  # Get main image path for all devices
  devices = product['image']
  #attach photos
  attach_product_photos(devices, @product)

  puts '************************'
  puts 'second round'
  product['gallery'].each do |_key, devices|
    attach_product_photos(devices, @product)
  end
    # devices.each do |device, img_path|
    #   Cloudinary::Uploader.upload("app/assets/challenge_briefing/starter-code/#{img_path}", { public_id: device + '_' + cloudinary_file_name(img_path)})
    # end
end

puts "photos uploaded"
puts 'zo/'