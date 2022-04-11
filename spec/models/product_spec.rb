require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # checking if product name is not present
    it 'validates :name, presence: true' do 
      product = Product.new(name: nil)
      category = Category.new()
      product.category = category
      expect(product).to_not be_valid
    end
    it 'validates :price, presence: true' do
      product = Product.new(price: nil)
      category = Category.new()
      product.category = category
      expect(product).to_not be_valid
    end
    it 'validates :quantity, presence: true' do
      product = Product.new(quantity: nil)
      category = Category.new()
      product.category = category
      expect(product).to_not be_valid
    end
    it 'validates :category, presence: true' do
      product = Product.new(category: nil)
      expect(product).to_not be_valid
    end
    it 'is valid with all 4 fields' do 
      product = Product.new
      product.name = 'Baseball Cap'
      product.price = 29.99
      product.quantity = 40
      product.category = Category.new
      expect(product).to be_valid
    end
  end
end
