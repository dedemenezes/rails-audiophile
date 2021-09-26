class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @images = get_images('mobile')
    authorize @product
  end

  private

  def get_images(device)
    name = @product.name.gsub(" ", "_")
    ActiveStorage::Blob.where('filename LIKE ?', "#{name}%#{device}%")
  end
end
