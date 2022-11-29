# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_product, only: %i[show new edit update destroy]

  authorize_resource

  def index
    @products = Product.with_attached_images.all.paginate(page: params[:page], per_page: 3)
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

  private

  def product_params
    params.require(:product).permit(:title, :article, :description, :price, :category_id, images: [])
  end

  def set_product
    @product = params[:id] ? Product.with_attached_images.find(params[:id]) : Product.new
  end
end
