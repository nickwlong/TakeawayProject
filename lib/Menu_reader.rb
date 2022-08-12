require_relative './Menu'

class MenuReader
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
        @io.puts "To place an order, please type the item \nname exactly as found in the menu. \nThank you for visiting".center(40)
        @io.puts "------------------------------------------------"
    end

    def print_menu
        self.print_header

        self.print_starters

        self.print_mains

        self.print_desserts

        self.print_footer
    end
end
hotelNicholas = Menu.new
hotelNicholas.add_dish("Onion Soup", "6.50", "starter")
hotelNicholas.add_dish("Carrot Soup", "6.50", "starter")
hotelNicholas.add_dish("Brixham Crab", "11.50", "starter")
hotelNicholas.add_dish("Hand Dived Devon Scallop", "10.25", "starter")
hotelNicholas.add_dish("Rump of New Season Lamb", "16.50", "main")
hotelNicholas.add_dish("Devon Blue Croquettes", "14.00", "main")
hotelNicholas.add_dish("Dry Aged Beef Fillet", "27.50", "main")
hotelNicholas.add_dish("Roasted Monkfish", "16.50", "main")
hotelNicholas.add_dish("Apricot Sorbet", "6.00", "dessert")
hotelNicholas.add_dish("Honey, Whisky and Almond Sponge", "8.00", "dessert")
hotelNicholas.add_dish("Chocolate Arctic Roll", "7.00", "dessert")
hotelNick = MenuReader.new(hotelNicholas)

