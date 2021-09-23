# Parse JSON data 
file = "#{File.dirname(__FILE__)}/../app/assets/challenge_briefing/starter-code/data.json"
data = JSON.parse(File.read(file))

puts 'Creating shop data'
data.each do |element|
  # Create category
  category = Category.find_by(name: element['category'])
  if category.nil?
    category = Category.create!(name: element['category'])
  end
  product = Product.new(name: element['name'], price: element['price'], category: category, description: element['description'], features: element['features'])
  product_pieces = element['includes'].map do |piece|
    Piece.create!(name: piece['item'], amount: piece['quantity'])
  end
  product.pieces = product_pieces
  product.save!

  puts product.inspect
end

puts "#{Product.count} products created"