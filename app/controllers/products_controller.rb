class ProductsController < ApplicationController
	before_action :set_product, only: [:show, :new, :edit, :update, :destroy]

	def index
		@products = Product.all
	end

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
		params.require(:product).permit(:title, :article, :description, :price, :category_id)
	end

	def set_product
		@product ||= params[:id] ? Product.find(params[:id]) : Product.new
	end
end
