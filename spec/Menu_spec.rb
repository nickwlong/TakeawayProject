require "Menu"

RSpec.describe Menu do
    describe "#add and #dishes_of_category method" do
        it "Checks only starter dishes are returned" do
            testmenu = Menu.new
            fakedish = Dish.new("fakedish", "7.50", "starter", 0)

            testmenu.add_dish("fakedish", "7.50", "starter")
            testmenu.add_dish("fakedish2","5", "main")
            
            expect(testmenu.dishes_of_category("starter")).to eq [fakedish]
        end
        it "Checks all dishes are returned" do
            testmenu = Menu.new
            fakedish = Dish.new("fakedish", "7.50", "starter", 0)
            fakedish2 = Dish.new("fakedish2","5", "main", 0)

            testmenu.add_dish("fakedish", "7.50", "starter")
            testmenu.add_dish("fakedish2","5", "main")
            
            expect(testmenu.dishes_of_category).to eq [fakedish, fakedish2]
        end
    end
    describe "#start_list_print method" do
        it "Checks a list of formatted strings of starters is returned" do
            testmenu = Menu.new
            testmenu.add_dish("fakedish", "7.50", "starter")
            testmenu.add_dish("fakedish2", "5", "main")
            
            expect(testmenu.string_dishes_with_prices("starter")).to eq ["fakedish: £7.50\n"]
        end
        it "Checks a list of formatted strings of starters is returned - multiple" do
            testmenu = Menu.new
            testmenu.add_dish("fakedish", "7.50", "starter")
            testmenu.add_dish("fakedish2", "5", "starter")
            
            expect(testmenu.string_dishes_with_prices("starter")).to eq ["fakedish: £7.50\n", "fakedish2: £5\n"]
        end
    end
    describe "#dish(choice) method" do
        it "Checks the Dish object for the particular dish is returned" do
            testmenu = Menu.new
            fakedish = Dish.new("fakedish", "7.50", "starter", 0)
            fakedish2 = Dish.new("fakedish2","5", "main", 0)

            testmenu.add_dish("fakedish", "7.50", "starter")
            testmenu.add_dish("fakedish2","5", "main")

            expect(testmenu.dish("fakedish")).to eq fakedish
        end
    end
    describe "#dish_customer_quantity" do
        it "returns default quantity 0" do
            testmenu = Menu.new
            testmenu.add_dish("fakedish", "7.50", "starter")
            testmenu.add_dish("fakedish2","5", "main")

            result = testmenu.dish_customer_quantity("fakedish")
            expect(result).to eq 0
        end
    end

end