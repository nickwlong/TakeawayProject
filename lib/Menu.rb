Dish = Struct.new(:name, :price, :category, :customer_quantity)

class Menu
  def initialize
    @menu = []
  end

  def add_dish(name, price, category, customer_quantity = 0)
    @menu << Dish.new(name, price, category, customer_quantity)
  end

  def dish(choice)
    chosen_dish = @menu.select{|dish| dish.name.downcase == choice.downcase}
    return chosen_dish[0]
  end

  def dish_customer_quantity(dish)
    self.dish(dish).customer_quantity
  end

  def dishes_of_category(category="all dishes")
    return @menu if category == "all dishes"
    return @menu.select{|dish| dish.category == category}
  end

  def string_dishes_with_prices(category)
      return dishes_of_category(category).map{|dish| "#{dish.name}: £#{dish.price}\n"}
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