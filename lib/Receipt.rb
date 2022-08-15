require_relative "./Menu.rb"
require_relative "./Menu_reader.rb"
require_relative "./Customer.rb"

class Receipt
    def initialize( io = Kernel)
        @io = io
    end

    def print_receipt(basket)
        self.receipt_header

        @io.puts self.receipt_dishes_from_basket(basket)

        self.receipt_total

        self.receipt_footer
    end

    def receipt_header
        @io.puts "========================================="
        @io.puts "Thank you for buying from us, \nyour dishes and a total can be found below:"
        @io.puts "\n\n"
    end

    def receipt_dishes_from_basket(basket)
        #Basket is an array of objects of dishes. Want to return a count of how many of each dish there are
        #"Count of the dishes" x "Name of dish" @ "price of dish"
        #"2x Onion Soup @ 6.50"
        receipt_dish_list = basket.map do |dish|
            "#{dish.customer_quantity}x #{dish.name} @ #{dish.price}"
        end
        return receipt_dish_list.join("\n")
    end

    def receipt_total
    end

    def receipt_footer
    end
end




# rec = Receipt.new(nick)
# p rec.receipt_dishes_from_basket