# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.buyer?
        buyer_abilities(user)
      elsif user.seller?
        seller_abilities(user)
      elsif user.director?
        director_abilities(user)
      elsif user.admin?
        admin_abilities
      end
    else
      guest_abilities
    end
  end

  def guest_abilities
    can %i[read sort_by_availability], Product
  end

  def buyer_abilities(buyer)
    guest_abilities
    can :read, [ShoppingCart, Order]
    can %i[add_product delete_product], ShoppingCart, { buyer_id: buyer.id }
    can :create, Order
    can :destroy, Order, { buyer_id: buyer.id }
    can :add_subscriber, Product
  end

  def seller_abilities(_seller)
    guest_abilities
    can :read, [Category, Order]
    can %i[create update destroy], [Product, Category]
    can :update, Order
    can :update_count, Product
  end

  def director_abilities(user)
    seller_abilities(user)
    can %i[update_salary destroy], User
  end

  def admin_abilities
    can :manage, :all
  end
end
