require "receipt"

RSpec.describe Receipt do
    describe "#receipt_dishes_from_basket" do
        it "returns a formatted array of strings" do
            receipt = Receipt.new
            dish1 = double(:dish1, name: "Onion Soup", price: "6.50", customer_quantity: 2)
            dish2 = double(:dish2, name: "Carrot Soup", price: "7.50", customer_quantity: 4)
            custdouble = double(:menu1, basket: [dish1, dish2])
            result = receipt.receipt_dishes_from_basket(custdouble.basket)
            expect(result).to eq "2x Onion Soup @ £6.50\n4x Carrot Soup @ £7.50"
        end
    end

    describe "#receipt_total" do
        it "returns a string including the total cost of 2 basket items" do
            receipt = Receipt.new
            dish1 = double(:dish1, name: "Onion Soup", price: "6.50", customer_quantity: 2)
            dish2 = double(:dish2, name: "Carrot Soup", price: "7.50", customer_quantity: 4)
            custdouble = double(:menu1, basket: [dish1, dish2])
            result = receipt.receipt_total(custdouble.basket)
            expect(result).to eq "Total cost: £43.00"
        end
        it "returns a string including the total cost of 3 basket items" do
            receipt = Receipt.new
            dish1 = double(:dish1, name: "Onion Soup", price: "6.50", customer_quantity: 2)
            dish2 = double(:dish2, name: "Carrot Soup", price: "7.50", customer_quantity: 4)
            dish3 = double(:dish3, name: "Pepper Soup", price: "4.33", customer_quantity: 1)
            custdouble = double(:menu1, basket: [dish1, dish2, dish3])
            result = receipt.receipt_total(custdouble.basket)
            expect(result).to eq "Total cost: £47.33"
        end
        it "returns a string including the total cost of 1 basket item w/ no pennies" do
            receipt = Receipt.new
            dish1 = double(:dish1, name: "Onion Soup", price: "6.0", customer_quantity: 1)
            custdouble = double(:menu1, basket: [dish1])
            result = receipt.receipt_total(custdouble.basket)
            expect(result).to eq "Total cost: £6.00"
        end
    end


end