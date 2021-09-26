module SeedsHelper
  module AttachPhotos
    def self.to_products(product, _index)
      # Get product
      @product = Product.find_by(name: product['name'])
      puts "Attaching photos to #{@product.name}"
      # Get main image path for all devices
      # attach photos
      puts "Main photo"
      attach_product_photos(product['image'], @product)
      puts 'Gallery photos'
      product['gallery'].each do |_key, devices|
        attach_product_photos(devices, @product)
      end
      puts "photos attached to #{@product.name}"
    end

    def self.attach_product_photos(devices_hash, product)
      devices_hash.each do |device, main_image_path|
        public_id = SeedsHelper::CloudinaryHelper.set_public_id(product.name, device, main_image_path)
        # Open cloudinary file
        file = SeedsHelper::CloudinaryHelper.get_url(public_id)
        # attach photo to product
        product.photos.attach(io: file, filename: public_id, content_type: 'image/jpg')
      end
    end

    def self.to_category(category, file)
      # attach photo to category
      category.photo.attach(io: file, filename: category.name, content_type: 'image/png')
      puts "Photo attached to #{category.name}"
    end
  end
end
