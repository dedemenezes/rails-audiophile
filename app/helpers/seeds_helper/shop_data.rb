module SeedsHelper
  module ShopData
    def self.set_shop(data)
      start_time = Time.now
      puts 'Creating shop data'
      data.each do |product|
        # Create category
        @category = Category.find_by(name: product['category'])
        if @category.nil?
          @category = Category.create!(name: product['category'])
        end
        puts @category.name
      
        # Create Product
        @product = Product.new(name: product['name'], category: @category, new: product['new'] ,    price: product['price'], description: product['description'], features: product ['features'])
      
        # Create Pieces
        product_pieces = product['includes'].map do |piece|
          Piece.create!(name: piece['item'], amount: piece['quantity'])
        end
      
        # Associate pieces to product
        @product.pieces = product_pieces
        @product.save!
        puts @product.inspect
      end
    
      puts "#{Product.count} products created"
      puts "***"
      puts "#{Time.now - start_time} seconds"
      puts "***"
    end
  end
end