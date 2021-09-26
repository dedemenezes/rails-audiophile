require 'open-uri'

# START
start_total = Time.now
# Cleaning DB
puts 'destroying Category'
Category.destroy_all
puts 'destroying Piece'
Piece.destroy_all
puts 'destroying User'
User.destroy_all
puts 'DB clean zo/'


# Parse JSON data 
products = SeedsHelper::ParseData.json_db

# Create shop data. Categories, Pieces and Products
SeedsHelper::ShopData.set_shop(products)

# Upload all images to cloudinary
products.each_with_index do |product, index|
  # Photos already uploaded to cloudinary. Use one time only.
  # SeedsHelper::CloudinaryHelper.product_main_image(product)
  # SeedsHelper::CloudinaryHelper.product_gallery_images(product)
  
  # Attach photos to all products
  SeedsHelper::AttachPhotos.to_products(product, index)
end

# Attach photo to category
puts 'Attaching photos to Categories'
Category.all.each do |category|
  public_id = category.name
  Cloudinary::Uploader.upload("app/assets/images/image-#{public_id}.png", { public_id: public_id })
  file = SeedsHelper::CloudinaryHelper.get_url(public_id)
  SeedsHelper::AttachPhotos.to_category(category, file)
end


SeedsHelper::CreateUsers.test_users

puts 'DONE!'
puts "Categories - #{Category.count} "
puts "Products - #{Product.count} "
puts "Pieces - #{Piece.count}"
puts 'zo/'
puts "#{Time.now - start_total} seconds"