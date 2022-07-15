class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_products
  before_action :all_categories, only: %i[show]

  def index
    @categories = policy_scope(Category).includes(:product)
    authorize @categories
  end

  def show
    @category = Category.includes(:products).find(params[:id])
    authorize @category
  end

  private

  def set_products
    @products = Product.includes(:category).where(category: @category)
  end
end
