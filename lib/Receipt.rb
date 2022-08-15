require_relative "./Menu.rb"
require_relative "./Menu_reader.rb"
require_relative "./Customer.rb"

class Receipt
    def initialize(customer, io = Kernel)
        @customer = customer
        @basket = customer.basket
        @baskethash = customer.baskethash
        @menu = customer.menu
        @io = io
    end

    def print_receipt
        self.receipt_header

        @io.puts self.receipt_dishes_from_basket

        self.receipt_total

        self.receipt_footer
    end

    def receipt_header
        @io.puts "========================================="
        @io.puts "Thank you for buying from us, \nyour dishes and a total can be found below:"
        @io.puts "\n\n"
    end

    def receipt_dishes_from_basket
        #Basket is an array of objects of dishes. Want to return a count of how many of each dish there are
        #"Count of the dishes" x "Name of dish" @ "price of dish"
        #"2x Onion Soup @ 6.50"
        receipt_dish_list = @basket.map do |dish|
            "#{dish.customer_quantity}x #{dish.name} @ #{dish.price}"
        end
        return receipt_dish_list.join("\n")
    end

    def receipt_total
    end

    def receipt_footer
    end
end


# hotelNicholas = Menu.new
# hotelNicholas.add_dish("Onion Soup", "6.50", "starter")
# hotelNicholas.add_dish("Carrot Soup", "6.50", "starter")
# hotelNicholas.add_dish("Brixham Crab", "11.50", "starter")
# hotelNicholas.add_dish("Hand Dived Devon Scallop", "10.25", "starter")
# hotelNicholas.add_dish("Rump of New Season Lamb", "16.50", "main")
# hotelNicholas.add_dish("Devon Blue Croquettes", "14.00", "main")
# hotelNicholas.add_dish("Dry Aged Beef Fillet", "27.50", "main")
# hotelNicholas.add_dish("Roasted Monkfish", "16.50", "main")
# hotelNicholas.add_dish("Apricot Sorbet", "6.00", "dessert")
# hotelNicholas.add_dish("Honey, Whisky and Almond Sponge", "8.00", "dessert")
# hotelNicholas.add_dish("Chocolate Arctic Roll", "7.00", "dessert")
# hotelNick = MenuReader.new(hotelNicholas)
# nick = Customer.new(hotelNick)

# rec = Receipt.new(nick)
# p rec.receipt_dishes_from_basket