require_relative "./Menu.rb"
require_relative "./Menu_reader.rb"
require_relative "./Receipt.rb"
require_relative "./twilio_message.rb"



Customer = Struct.new(:contactname, :contactaddress, :contactphonenumber) do
  attr_accessor :basket, :menu, :baskethash
  def initialize(menureader, receipt, io=Kernel) #Do I need receipt here?
    @basket = []
    @menureader = menureader
    @menu = @menureader.menu
    @io = io
    @input_choice = ""
    @receipt = receipt
  end

  def run
    welcome_customer_details
    customer_terminal_choice
    customer_message
  end
  
  def add_item_to_basket
    @io.puts "\n**  Please type the name of the dish you wish to add exactly as found in the menu:  **"
    dish = @io.gets.chomp
    @io.puts "\n**  How many of this dish would you like? Please type a number  **"
    quantity = @io.gets.chomp.to_i
    @menu.dish(dish).customer_quantity += quantity
    @basket << @menu.dish(dish)
  end

  def welcome_customer_details
    @io.puts "Welcome to the takeaway service for Hotel Nicholas, please enter your name:"
    @contactname = @io.gets.chomp
    @io.puts "\nWelcome, #{@contactname}, please enter your address:"
    @contactaddress = @io.gets.chomp
    @io.puts "\nPlease enter your contact number:"
    @contactphonenumber = @io.gets.chomp
    @menureader.print_menu
  end

  def customer_terminal_choice
    @io.puts "=========================================\n\nPlease type 'menu' to view the menu, 'add dish' to start adding dishes to your basket. \nWhen finished adding dishes, type 'print receipt'. \nIf happy with your receipt, type 'submit order'\nType 'quit' to exit.\n"
    @input_choice = @io.gets.chomp
    while @input_choice != "submit order"
      if @input_choice == "print receipt"
        self.receipt_printout
        self.customer_terminal_choice
      elsif @input_choice == 'menu'
        @menureader.print_menu
        self.customer_terminal_choice
      elsif @input_choice == 'add dish'
        self.add_item_to_basket
        self.customer_terminal_choice
      elsif @input_choice == 'quit'
        self.exit
      else
        self.customer_terminal_choice
      end
    end
<<<<<<< HEAD
=======
    
>>>>>>> parent of bcbeefa (changes to live use cases)
  end
  
  def receipt_printout
    if !@basket.empty? 
      @receipt.print_receipt(@basket)
    else
      @io.puts "\nERROR: You must add dishes to your basket before requesting a receipt!\n"
    end
  end

  def customer_message
    time = (Time.now + 7200).strftime("%H:%M")
    name = self.contactname
    total_cost = @receipt.total_cost(@basket)
    @twilio.send_message("Dear #{name}, thank you for your order totalling £#{total_cost} from Hotel Nicholas. It should be with you by #{time}")
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
# receipttest = Receipt.new
# nick = Customer.new(hotelNick, receipttest)
<<<<<<< HEAD
=======
# ted = Customer.new(hotelNick, receipttest)

>>>>>>> parent of bcbeefa (changes to live use cases)
# nick.run
