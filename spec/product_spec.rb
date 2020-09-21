require "rails_helper"

RSpec.describe Product, type: :model do

  
  category =Category.new(name: "category1")
  
  product = category.products.new(
      name: "product1",
      price_cents: 200,
      quantity: 50
    )
  

  describe 'Validations' do
    it "should have a valid product"  do
      expect(product).to be_valid
      expect(product.errors.full_messages).to be_empty
      
    end

    it "should not be valid without a name" do
      product.name=nil
      expect(product).not_to be_valid
      expect(product.errors.full_messages).not_to be_empty
      expect(product.errors.full_messages).to include "Name can't be blank"
    end

    it "should not be valid without a price"  do
      product.price_cents = nil
      expect(product).not_to be_valid
      expect(product.errors.full_messages).not_to be_empty
      expect(product.errors.full_messages).to include "Price can't be blank"
    end

    it "should not be valid without a quantity" do
      product.quantity = nil
      expect(product).not_to be_valid
      expect(product.errors.full_messages).not_to be_empty
      expect(product.errors.full_messages).to include "Quantity can't be blank"  
    end

    it "should not be valid withhout a category" do
      product.category =nil
      expect(product).not_to be_valid
      expect(product.errors.full_messages).not_to be_empty
      expect(product.errors.full_messages).to include "Category can't be blank"
    end
  end
end