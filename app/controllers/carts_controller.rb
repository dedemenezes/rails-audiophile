class CartsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_cart, :find_user_cart
  def show
    authorize @cart
  end
end
