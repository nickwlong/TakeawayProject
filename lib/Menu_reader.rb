require_relative './Menu'

class MenuReader
    attr_accessor :menu
    def initialize(menu, io = Kernel)
        @menu = menu
        @io = io
    end

    def print_header
        @io.puts "------------------------------------------------".center(40)
        @io.puts "Welcome to Hotel Nicholas\n".center(40)
    end

    def print_starters
        if not @menu.dishes_of_category('starter').empty?
            @io.puts "\nOur starters are:        "
            @io.puts @menu.string_dishes_with_prices('starter')
        end
    end

    def print_mains
        if not @menu.dishes_of_category('main').empty?
            @io.puts "\nOur main dishes are:        "
            @io.puts @menu.string_dishes_with_prices('main')
        end
    end

    def print_desserts
        if not @menu.dishes_of_category('dessert').empty?
            @io.puts "\nOur dessert dishes are:        "
            @io.puts @menu.string_dishes_with_prices('dessert')
        end
    end

    def print_footer
        @io.puts "\n\n"
        @io.puts "**To place an order, please type the item \nname exactly as found in the menu.** \nThank you for visiting".center(40)
        @io.puts "------------------------------------------------\n\n"
    end

    def print_menu
        self.print_header

        self.print_starters

        self.print_mains

        self.print_desserts

        self.print_footer
    end
end

