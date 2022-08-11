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
Dish
Menu << Dish(name, price, category)
CustomerDetails (name, address, number)
Customer << CustomerDetails, add items from Menu
Receipt << CustomerDetails/Customer
Messaging? << Customer control

Also design the interface of each class in more detail.
```ruby
####
Dish = Struct.new(:name, :price, :category)
####
class Menu
  def initialize
    @menu = []
  end

  def add_dish(name, price, category)
    @menu << Dish.new(name, price, category)
  end

  def dish(choice)
    #returns the dish object matching the specified name
  end

  def starters
    return @menu.select {|dish| dish[category] = 'starter'}
  end

  def starters_list
    #returns a list of the names of starter dishes
  end

  def mains
     #returns main dishes
  end

  def desserts
    #returns dessert dishes
  end
end

####
Customer = Struct.new(:contactname, :contactaddress, :contactphonenumber)
  def initialize
    @basket = []
  end

  def print_all_menu(category) #category is either starter, main, dessert, or all
    #puts to terminal the entire menu
  end

  def add_dish_to_basket(dish_name)
    #adds the dish object to the @basket array for use
  end

  def print_receipt
    #puts a receipt of the total cost of items in the basket so far


  private
#COULD MAKE MENU LAYOUT SEPARATE CLASS?
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