Dish = Struct.new(:name, :price, :category)

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
    return @menu.select {|dish| dish.category = 'starter'}
  end


  def starter_list
    return starters.map{|dish| dish.name}
  end


  def mains
     #returns main dishes
  end

  def desserts
    #returns dessert dishes
  end
end

hotelNicholas = Menu.new
hotelNicholas.add_dish("Onion Soup", 6.50, "starter")

p hotelNicholas.starter_list