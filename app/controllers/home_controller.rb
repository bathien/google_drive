class HomeController < ApplicationController
  def index
    @products = Product.includes(:images).all
    @categories = Category.second
  end
end
