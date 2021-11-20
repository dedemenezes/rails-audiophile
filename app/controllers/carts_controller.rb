class CartsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :all_categories
  def show
    authorize @cart
  end
end
