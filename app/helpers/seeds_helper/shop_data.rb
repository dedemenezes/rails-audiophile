module SeedsHelper
  module ShopData
    def self.create_category(product)
      category = Category.find_by(name: product['category'])
      category = Category.create!(name: product['category']) if category.nil?
      puts category.name
      category
    end

    def self.create_product(product, category)
      Product.new(
        name: product['name'],
        category: category,
        new: product['new'],
        price: product['price'],
        description: product['description'],
        features: product['features']
      )
    end

    def self.create_pieces(product)
      product['includes'].map do |piece|
        Piece.create!(name: piece['item'], amount: piece['quantity'])
      end
    end

    def self.create_shop(data)
      data.each do |product|
        # Create category
        @category = create_category(product)
        # Create Product
        @product = create_product(product, @category)
        # Create Pieces
        product_pieces = create_pieces(product)
        # Associate pieces to product
        @product.pieces = product_pieces
        @product.save!
      end
    end
  end
end
