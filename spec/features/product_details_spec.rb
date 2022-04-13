require 'rails_helper'

RSpec.feature "A User can navigate to product details page by clicking on a product", type: :feature, js: true do

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

  scenario "clicking on the details button leads product detail page" do
    # ACT
    visit root_path

    # Selector and Action Click
    find_link("Details").trigger("click")
    # click_link "Details"
    
    # DEBUG
    # Waiting 1 second in order for Page Load
    # sleep 1
    # save_and_open_screenshot
    # puts page.html
    
    # VERIFY
    expect(page).to have_css 'section.products-show'
    
  end
end
