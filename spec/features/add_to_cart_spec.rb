require 'rails_helper'

RSpec.feature "Add to cart", type: :feature, js: true do
  
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

  scenario "user can click add to cart button to have cart increase by one" do
    visit root_path
    
    expect(page).to have_content("My Cart (0)")

    within(".product:nth-of-type(1)") { click_button "Add" }

    expect(page).not_to have_content("My Cart (0)")
    expect(page).to have_content("My Cart (1)")
  end

  scenario "My Cart is initially empty with text, when 'add' is clicked on individual product, My cart should have a list" do
    visit "/cart"
    expect(page).to have_content("Your cart has nothing on it, add more items from home Page")

  
    visit root_path
    within(".product:nth-of-type(1)") { click_button "Add" }


    visit "/cart"
    expect(page).to have_content("My Cart")
    expect(page).to have_content("Unit Price")
    expect(page).to have_content("Quantity")
    expect(page).to have_content("Price")
  end

end