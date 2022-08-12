local_dir = File.expand_path('../', __FILE__)
$LOAD_PATH.unshift(local_dir)

require 'Menu'

class MenuReader
    def initialize(menu)
        @menu = menu
    end


    def print_header
        puts "------------------------------------------------".center(40)
        puts "Welcome to Hotel Nicholas\n".center(40)
    end

    def print_starters
        puts "\nOur starters are:        "
        puts @menu.string_dishes_with_prices('starter')

    end

    def print_mains
        puts "\nOur main dishes are:        "
        puts @menu.string_dishes_with_prices('main')
    end

    def print_desserts
        puts "\nOur dessert dishes are:        "
        puts @menu.string_dishes_with_prices('dessert')
    end

    def print_footer
        puts "\n\n"
        puts "Thank you for visiting".center(40)
        puts "------------------------------------------------"
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
hotelNick.print_menu
