class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with :name => ENV["admin_username"], :password => ENV["admin_password"]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(@category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Categorie created!'
    else
      render :new
    end
  end

end
