module SeedsHelper
  module CloudinaryHelper

    def self.upload_home_images(image_path)
      public_id = file_name(image_path)
      Cloudinary::Uploader.upload(image_path, { public_id: public_id })
    end
  
    def self.product_main_image(product)
      # Upload photo to cloudinary
      product['image'].each do |device, img_path|
        public_id = set_public_id(product['name'], device, img_path)
        Cloudinary::Uploader.upload(
          "app/assets/challenge_briefing/starter-code/#{img_path}",
          { public_id: public_id }
        )
      end
    end

    def self.get_url(public_id)
      url = Cloudinary::Utils.cloudinary_url(public_id)
      URI.open(url)
    end

    def self.file_name(file_path)
      name_regex = /\w*-\w*\W*\d*.\w{3}$/
      file_path.match(name_regex)[0][0...-4]
    end

    def self.set_public_id(product_name, device, img_path)
      "#{product_name.gsub(' ', '_')}_#{device}_#{file_name(img_path)}"
    end

    def self.product_gallery_images(product)
      product['gallery'].each do |_round, devices|
        devices.each do |device, img_path|
          public_id = set_public_id(product['name'], device, img_path)
          Cloudinary::Uploader.upload(
            "app/assets/challenge_briefing/starter-code/#{img_path}",
            { public_id: public_id }
          )
        end
      end
    end
  end
end
