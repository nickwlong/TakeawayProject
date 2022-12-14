TAKEAWAY Project Recipe

1. Describe the Problem

<!-- 
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.
-->

Use the twilio-ruby gem to implement this next one. You will need to use doubles too.

<!-- 
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.
 --> 



2. Design the Class System

   ┌────────────────────────────┐    ┌───────────────────────────────┐
   │MenuReader                  │    │                               │
   │                            │    │ CUSTOMER                      │
   │ Takes dishes from menu     │    │                               │
   │                            │    │ run (creates terminal entry   │    ┌────────────────────┐
   │ Creates printout of menu   │    │   (also prints receipt) point)│    │Twilio              │
   │     Header                 │    │ add_item_to_basket            │    │                    │
   │     Print starters etc.   ─┼────►                               ├────►                    │
   │     Footer                 │    │ store customer details        │    │                    │
   │ (print_menu)               │    │                               │    │                    │
   │                            │    │ provide customer term choice  │    │                    │
   │                            │    │                               │    └────────────────────┘
   │                            │    │ output details to twilio      │
   │                            │    │                               │
   │                            │    │                               │
   └─────────────▲──────────────┘    └─────────────▲─────────────────┘
                 │                                 │
   ┌─────────────┴──────────────┐      ┌───────────┴────────────────┐
   │Menu                        │      │  Receipt                   │
   │                            │      │                            │
   │ Stores Dish objects in     │      │  Prints receipt of:        │
   │     an array of dishes     │      │     Header                 │
   │      (@menu)               │      │     List of dishes         │
   │                            │      │        and quantities      │
   │ Add_dish                   │      │        and individual price│
   │                            │      │                            │
   │ dish_customer_quantity     │      │     Total price            │
   │                            │      │     Footer                 │
   │ Return dishes of a category│      │                            │
   │                            │      │                            │
   │ Return dish/price string   │      │                            │
   └┬──────────────────────────┬┘      └────────────────────────────┘
    ├──────────────────────────┤
    │ Dish                     │
    │  name                    │
    │  price                   │
    │  category  (starter etc.)│
    │  customer_quantity = 0   │
    └──────────────────────────┘

Also design the interface of each class in more detail.
```ruby
####
Dish = Struct.new(:name, :price, :category)
####
class Menu
  def initialize
    @menu = []
  end

  def add_dish(name, price, category) #all inputs are strings
    @menu << Dish.new(name, price, category)
  end

  def dish(choice)
    #returns the dish object matching the specified name
  end

  def dishes_of_category(category)#category should default "all dishes" or be starter/main/dessert
  #returns an array of Dish objects for a particular category, or if no argument, will return all dishes
  end

  def string_dishes_with_prices(category)
  #returns a string of "#{dish.name}: £#{dish.price}\n" for each dish in the category
  end

end

####
Customer = Struct.new(:contactname, :contactaddress, :contactphonenumber)
  def initialize
    @basket = []
  end

  def run
    @io.puts "Welcome to the takeaway service for Hotel Nicholas, please enter your name:"
    @contactname = @io.gets.chomp
    "Please enter your address"
    @contactaddress = @io.gets.chomp
    "Please enter your contact number"
    @contactphonenumber = @io.gets.chomp
  end
  

  def print_all_menu(category) #category is either starter, main, dessert, or all
    #puts to terminal the entire menu
  end

  def add_dish_to_basket(dish_name)
    #adds the dish object to the @basket array for use
  end

  def print_receipt
    #puts a receipt of the total cost of items in the basket so far



class MenuReader
  def print_header
    #returns header of menu
  end

  def print_starters
    #returns starters + price
  end

  def print_mains
    #returns mains and prices
  end

  def print_desserts
    #returns desserts and prices
  end

  def print_footer
    #returns footer of menu
  end
end


class Receipt
  def initialize(customer)
    @customer_basket = customer.basket
  end

  def print_receipt
    #makes a laid out receipt for the customer
  end

  def total_cost
    #Adds cost of all items in customer basket
    #Returns cost as string
  end

  def receipt_header
  end

  def receipt_footer
  end
end

class Customer_communication
  #Uses twilio to send text to customer to confirm delivery time
end


  
    


```
3. Create Examples as Integration Tests
Create examples of the classes being used together in different situations and combinations that reflect the ways in which the system will be used.
```ruby
hotelNicholas = Menu.new
hotelNicholas.add_dish("Onion Soup", 6.50, "starter")
hotelNicholas.add_dish("Carrot Soup", 6.50, "starter")
hotelNicholas.add_dish("Brixham Crab", 11.50, "starter")
hotelNicholas.add_dish("Hand Dived Devon Scallop", 10.25, "starter")
hotelNicholas.add_dish("Rump of New Season Lamb", 16.50, "main")
hotelNicholas.add_dish("Devon Blue Croquettes", 14.00, "main")
hotelNicholas.add_dish("Dry Aged Beef Fillet", 27.50, "main")
hotelNicholas.add_dish("Roasted Monkfish", 16.50, "main")
hotelNicholas.add_dish("Apricot Sorbet", 6.00, "dessert")
hotelNicholas.add_dish("Honey, Whisky and Almond Sponge", 8.00, "dessert")
hotelNicholas.add_dish("Chocolate Arctic Roll", 7.00, "dessert")
hotelNicholas.starter # => returns dish objects with starter categories
hotelNickmenu = MenuReader.new(hotelNicholas)
hotelNickmenu.print_starters # => "Our starters are:/nOnion Soup: £6.50/nCarrot Soup: £6.50/nBrixham Crab: £11.50/nHand Dived Devon Scallop: £10.25"


```
4. Create Examples as Unit Tests
Create examples, where appropriate, of the behaviour of each relevant class at a more granular level of detail.

# EXAMPLE

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
Encode each example as a test. You can add to the above list as you go.

5. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.