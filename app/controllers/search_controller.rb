class SearchController < ApplicationController
  def search
    @products = Product.search(params[:search_data])
    render 'products/index'
  end
end
