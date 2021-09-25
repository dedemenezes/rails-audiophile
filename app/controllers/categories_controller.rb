class CategoriesController < ApplicationController
  before_action :set_products
  def show
    @category = Category.find(params[:id])
  end

  private

  def set_products
    @products = Product.where(category: @category)
  end
end
