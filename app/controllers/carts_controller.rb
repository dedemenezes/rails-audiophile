class CartsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_cart
  def show
    authorize @cart
  end
end
