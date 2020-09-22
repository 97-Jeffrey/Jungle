require 'rails_helper'

RSpec.feature "Visitor navigates from home page to product detail", type: :feature, js: true do
  
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see individual product's detail by click the product" do
    visit root_path

    find(".product:nth-of-type(1) img").click

    expect(page).to have_content("Name")
    expect(page).to have_content("Description")
    expect(page).to have_content("Quantity")
    expect(page).to have_content("Price")
    expect(page).to have_css ".products-show"
    
  end
end