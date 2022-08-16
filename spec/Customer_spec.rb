require "Customer"
require "Menu_reader"
require "Menu"

RSpec.describe Customer do
    describe "#add_item_to_basket" do
        it "adds item to basket" do
            io = double(:io)
            receipt = double(:receipt)
            expect(io).to receive(:puts).with("\n**  Please type the name of the dish you wish to add exactly as found in the menu:  **").ordered
            expect(io).to receive(:gets).and_return("Onion Soup").ordered
            expect(io).to receive(:puts).with("\n**  How many of this dish would you like? Please type a number  **").ordered
            expect(io).to receive(:gets).and_return("2").ordered
            
            hotelNicholasdishes = Menu.new
            hotelNicholasdishes.add_dish("Onion Soup", "6.50", "starter")
            hotelNick = MenuReader.new(hotelNicholasdishes)
            receipt = Receipt.new
            nick = Customer.new(hotelNick, receipt, io)
            nick.add_item_to_basket
            expectedbasket = [hotelNicholasdishes.dish("Onion Soup")]
            expect(nick.basket).to eq expectedbasket
        end
        it "adds item and updates quantity" do
            io = double(:io)
            receipt = double(:receipt)
            
            expect(io).to receive(:puts).with("\n**  Please type the name of the dish you wish to add exactly as found in the menu:  **").ordered
            expect(io).to receive(:gets).and_return("Onion Soup").ordered
            expect(io).to receive(:puts).with("\n**  How many of this dish would you like? Please type a number  **").ordered
            expect(io).to receive(:gets).and_return("2").ordered
            
            hotelNicholasdishes = Menu.new
            hotelNicholasdishes.add_dish("Onion Soup", "6.50", "starter")
            receipt = Receipt.new
            hotelNick = MenuReader.new(hotelNicholasdishes)
            nick = Customer.new(hotelNick, receipt, io)
            nick.add_item_to_basket
            result = hotelNicholasdishes.dish_customer_quantity("Onion Soup")
            expect(result).to eq 2
        end
        it "adds quantity of 2 to an existing 1" do
            io = double(:io)
            receipt = double(:receipt)
    
            expect(io).to receive(:puts).with("\n**  Please type the name of the dish you wish to add exactly as found in the menu:  **").ordered
            expect(io).to receive(:gets).and_return("Onion Soup").ordered
            expect(io).to receive(:puts).with("\n**  How many of this dish would you like? Please type a number  **").ordered
            expect(io).to receive(:gets).and_return("2").ordered
            
            hotelNicholasdishes = Menu.new
            hotelNicholasdishes.add_dish("Onion Soup", "6.50", "starter",1)
            hotelNick = MenuReader.new(hotelNicholasdishes)
            receipt = Receipt.new
            nick = Customer.new(hotelNick, receipt, io)
            nick.add_item_to_basket
            result = hotelNicholasdishes.dish_customer_quantity("Onion Soup")
            expect(result).to eq 3
        end
    end
    describe "receipt_printout" do
        it "puts error string if basket is empty" do
            io = double(:io)
            receipt = double(:receipt)
            menureader = double(:menureader, menu:[])
            testCust = Customer.new(menureader, receipt, io)
            expect(io).to receive(:puts).with("\nERROR: You must add dishes to your basket before requesting a receipt!\n")
            testCust.receipt_printout
        end
    end


end