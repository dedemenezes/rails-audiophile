class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
    authorize @product
  end
end
