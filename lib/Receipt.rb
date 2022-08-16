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

        @io.puts self.receipt_total

        self.receipt_footer
    end

    def receipt_header
        @io.puts "========================================="
        @io.puts "Thank you for buying from us, \nyour dishes and a total can be found below:"
        @io.puts "\n\n"
    end

    def receipt_dishes_from_basket(basket)
        receipt_dish_list = basket.map do |dish|
            "#{dish.customer_quantity}x #{dish.name} @ £#{dish.price}"
        end
        return receipt_dish_list.join("\n")
    end

    def receipt_total(basket)
        total_cost = 0.0
        basket.each{|dish| total_cost += (dish.price.to_f * dish.customer_quantity)}
        return "Total cost: £#{sprintf("%.2f" % total_cost.round(2))}"
    end

    def receipt_footer
    end
end




# rec = Receipt.new(nick)
# p rec.receipt_dishes_from_basket