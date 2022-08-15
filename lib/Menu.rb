Dish = Struct.new(:name, :price, :category, :customer_quantity)

class Menu
  def initialize
    @menu = []
  end

  def add_dish(name, price, category, customer_quantity = 0)
    @menu << Dish.new(name, price, category, customer_quantity)
  end

  def dish(choice)
    chosen_dish = @menu.select{|dish| dish.name == choice}
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
