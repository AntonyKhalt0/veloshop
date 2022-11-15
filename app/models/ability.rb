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
        director_abilities
      elsif user.admin?
        admin_abilities
      end
    else
      guest_abilities
    end
  end

  def guest_abilities
    can :read, Product
  end

  def buyer_abilities(buyer)
    guest_abilities
    can :read, [ShoppingCart, Order]
    can %i[add_product delete_product], ShoppingCart, { buyer_id: buyer.id }
    can :create, Order
    can :destroy, Order, { buyer_id: buyer.id }
    # can :create_comment, [Product]
  end

  def seller_abilities(seller)
    guest_abilities
    can :read, [Category, Order]
    can %i[create update destroy], [Product, Category]
    can :update, Order
  end

  def director_abilities
    seller_abilities
  end

  def admin_abilities
    can :manage, :all
  end
end
