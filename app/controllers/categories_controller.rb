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
    respond_to do |format|
      if @category.save
        format.html do
          redirect_to category_path(@category)
        end
      else
        format.js do
          render 'pages/home'
        end
      end
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
