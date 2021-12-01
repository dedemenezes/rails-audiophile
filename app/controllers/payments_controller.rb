class PaymentsController < ApplicationController
  def new
    @orders = policy_scope(Order)
  end
end
