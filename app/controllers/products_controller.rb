class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @main_image = @product.get_main_image('mobile')
    @gallery_images = @product.get_gallery_images('mobile').uniq
    authorize @product
  end
end
