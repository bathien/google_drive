class HomeController < ApplicationController
  def index
    @products = Product.includes(:images).all
    @categories = Category.second
  end

  def contact
    customer = {name: params[:name], email: params[:email], phone: params[:phone]}
    ApplicationMailer.contact_me(params[:message], customer).deliver_now
  end
end
