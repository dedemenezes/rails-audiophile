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

  def create
    @category = Category.new(category_params)
    authorize @category
    if @category.save
      redirect_to category_path(@category)
    else
      render "pages/home"
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_products
    @products = Product.where(category: @category)
  end
end
