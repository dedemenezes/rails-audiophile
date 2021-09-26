module SeedsHelper
  module CloudinaryHelper
    def self.product_main_image(product)
      # Upload photo to cloudinary
      product['image'].each do |device, img_path|
        public_id = set_public_id(product['name'], device, img_path)
        uploaded_file = Cloudinary::Uploader.upload("app/assets/challenge_briefing/starter-code/#{img_path}", { public_id: public_id })
      end
    end

    def self.get_url(public_id)
      url = Cloudinary::Utils.cloudinary_url(public_id)
      URI.open(url)
    end

    def self.set_file_name(file_path)
      file_name = /\w*-\w*\W*\d*.\w{3}$/
      file_path.match(file_name)[0][0...-4]
    end

    def self.set_public_id(product_name, device, img_path)
      "#{product_name.gsub(" ", "_")}_#{device}_#{set_file_name(img_path)}"
    end

    def self.product_gallery_images(product)
      product['gallery'].each_with_index do |(round, devices), index|
        devices.each do |device, img_path|
          public_id = set_public_id(product['name'], device, img_path)
          Cloudinary::Uploader.upload("app/assets/challenge_briefing/starter-code/#{img_path}", { public_id: public_id })
        end
      end
    end

    def self.category_image(category)

    end
  end
end