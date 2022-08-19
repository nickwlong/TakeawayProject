class Receipt
    def initialize( io = Kernel)
        @io = io
    end

    def print_receipt(basket)
        self.receipt_header

        @io.puts self.receipt_dishes_from_basket(basket)

        @io.puts self.receipt_total(basket)

        self.receipt_footer
    end

    def receipt_header
        @io.puts "=========================================\nThank you for buying from us, \nyour dishes and a total can be found below:\n"
    end

    def receipt_dishes_from_basket(basket)
        receipt_dish_list = basket.map do |dish|
            "#{dish.customer_quantity}x #{dish.name} @ £#{dish.price}"
        end
        return receipt_dish_list.join("\n")
    end

    def total_cost(basket)
        total_cost = 0.0
        basket.each{|dish| total_cost += (dish.price.to_f * dish.customer_quantity)}
        return total_cost
    end
    
    def receipt_total(basket)
        
        return "------------------------\nTotal cost: £#{sprintf("%.2f" % total_cost(basket).round(2))}\n"
    end

    def receipt_footer
        @io.puts "========================================="
    end

end
