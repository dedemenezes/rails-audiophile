class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.orders.where(state: 'pending')
      # scope.all
    end
  end

  def create?
    true
  end
end
