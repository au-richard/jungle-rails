class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with :name => ENV["admin_username"], :password => ENV["admin_password"]

  def show
    # declare instance variables inside here
    @num_products = Product.count
    @num_categories = Category.count
  end
end
