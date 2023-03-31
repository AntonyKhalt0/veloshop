# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_product, only: %i[show new edit update destroy update_count]

  authorize_resource

  def index
    @products = params['category'] ? products_with_category : all_products
  end

  def show
    @images = @product.images.paginate(page: params[:page], per_page: 1)
  end

  def new; end

  def edit; end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :update
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  def update_count
    @product.update(count: @product.count + 1)
    ProductNotifierJob.new.perform(@product) if @product.count == 1
    redirect_to root_path
  end

  def add_subscriber
    @product.subscribers << current_user
    @product.save
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :article, :description, :price, :category_id, images: [])
  end

  def set_product
    @product = params[:id] ? Product.with_attached_images.find(params[:id]) : Product.new
  end

  def products_with_category
    Product.joins(:category).where('categories.url_name = ?', params['category']).with_attached_images.paginate(
      page: params[:page], per_page: 3
    )
  end

  def all_products
    Product.with_attached_images.paginate(page: params[:page], per_page: 3)
  end
end
