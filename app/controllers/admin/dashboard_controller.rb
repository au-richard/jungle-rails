class Admin::DashboardController < ApplicationController
  def show
    # declare instance variables inside here
    @num_products = Product.count
    @num_categories = Category.count
  end
end
