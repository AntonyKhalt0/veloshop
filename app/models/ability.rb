# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    guest_abilities

    return unless user.present?

    buyer_abilities(user)

    return unless user.seller?

    seller_abilities(user)

    return unless user.director?

    director_abilities

    return unless user.admin?

    admin_abilities
  end

  def guest_abilities
    can :read, Product
  end

  def buyer_abilities(buyer)
    guest_abilities
    # can :create, [ShoppingCard, Order]
    # can :update, [ShoppingCard, Order]
    # can :destroy, [ShoppingCard, Order]
    # can :create_comment, [Product]
  end

  def seller_abilities(seller)
    guest_abilities
    can :read, Category
    can :create, [Product, Category]
    can :update, [Product, Category]
    can :destroy, [Product, Category]
    #can :me, Seller, user_id: user.id
  end

  def director_abilities
    seller_abilities
  end

  def admin_abilities
    can :manage, :all
  end
end