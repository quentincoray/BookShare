class SellingBookPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def create?
      is_user_authorized?
    end

    def update?
      is_user_authorized?
    end

    def destroy?
      is_user_authorized?
    end

    private

    def is_user_authorized?
      record.user == user
    end
  end
end
