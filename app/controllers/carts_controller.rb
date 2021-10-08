class CartsController < ApplicationController
  def show
    authorize @cart
  end
end
