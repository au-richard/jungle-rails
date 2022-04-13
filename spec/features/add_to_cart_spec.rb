require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end

  scenario "They see all products" do
    # ACT
    visit root_path

    # Selector and Action Click
    click_on("Add")

    # DEBUG
    save_and_open_screenshot

    # VERIFY
    expect(page).to have_css 'article.product'
  end
end
