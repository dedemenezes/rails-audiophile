class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_products

  def index
    @categories = policy_scope(Category)
    authorize @categories
  end

  def show
    @category = Category.find(params[:id])
    authorize @category
  end

  private

  def set_products
    @products = Product.where(category: @category)
  end
end
