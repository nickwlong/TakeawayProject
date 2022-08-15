require_relative "./Menu.rb"
require_relative "./Menu_reader.rb"
require_relative "./Receipt.rb"

Customer = Struct.new(:contactname, :contactaddress, :contactphonenumber) do
  attr_accessor :basket, :menu, :baskethash
  def initialize(menureader, receipt, io=Kernel)
    @basket = []
    @baskethash = {}
    @menureader = menureader
    @menu = @menureader.menu
    @io = io
    @input_choice = ""
    @receipt = receipt
  end

  def run
    self.welcome_customer_details
    @menureader.print_menu
    self.customer_terminal_choice
    @receipt.print_receipt(@basket)
  end
  
  def add_item_to_basket
    @io.puts "Please type the name of the dish you wish to add exactly as found in the menu:"
    dish = @io.gets.chomp
    @io.puts "How many of this dish would you like? Please type a number"
    quantity = @io.gets.chomp.to_i
    @menu.dish(dish).customer_quantity += quantity
    @basket << @menu.dish(dish)
    
  end

  private

  def welcome_customer_details
    @io.puts "Welcome to the takeaway service for Hotel Nicholas, please enter your name:"
    @contactname = @io.gets.chomp
    @io.puts "\nWelcome, #{@contactname}, please enter your address:"
    @contactaddress = @io.gets.chomp
    @io.puts "\nPlease enter your contact number:"
    @contactphonenumber = @io.gets.chomp
  end

  def customer_terminal_choice
    while @input_choice != "print receipt"
      @io.puts "Please type 'menu' to view the menu again, or 'add dish' to start adding dishes to your basket. \nWhen finished, type 'print receipt'."
      @input_choice = @io.gets.chomp
      break if @input_choice == "print receipt"
      if @input_choice == 'menu'
        @menureader.print_menu
      elsif @input_choice == 'add dish'
        self.add_item_to_basket
      elsif @input_choice == 'quit'
        self.quit
      end
    end
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
# receipt_ = Receipt.new
# nick = Customer.new(hotelNick, receipt_)
# nick.run
