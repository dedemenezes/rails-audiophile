class CartsController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    authorize @cart
  end
end
