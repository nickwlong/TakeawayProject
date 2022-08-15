require "receipt"

RSpec.describe "" do
    describe "#receipt_dishes_from_basket" do
        it "returns a formatted array of strings" do
            dish1 = double(:dish1, name: "Onion Soup", price: "6.50", customer_quantity: 2)
            dish2 = double(:dish2, name: "Carrot Soup", price: "7.50", customer_quantity: 4)
            custdouble = double(:menu1, menu: [dish1, dish2])
            result = 
            expect(result).to eq "2x Onion Soup @ £6.50\n4x Carrot Soup @ £7.50"
        end
    end
end