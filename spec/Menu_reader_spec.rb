require "Menu_reader"
require "Menu"

RSpec.describe MenuReader do
    describe "Unit tests with doubles" do
        it "Checks formatted string returned from Menu class" do
            io = double(:io)
            expect(io).to receive(:puts).with("\nOur starters are:        ").ordered
            expect(io).to receive(:puts).with("Onion Soup: £6.50").ordered

            menudouble = double(:menu, dishes_of_category: ['not-empty'], string_dishes_with_prices: "Onion Soup: £6.50")
            testReader = MenuReader.new(menudouble, io)
            testReader.print_starters
        end
        it "Skips printing of a category if the category has no dishes" do
            io = double(:io)
            expect(io).not_to receive(:puts).with("\nOur starters are:        ").ordered
            
            menudouble = double(:menu, dishes_of_category: [])
            testReader = MenuReader.new(menudouble, io)
            testReader.print_starters
        end
    end
    describe "integration #print_starters" do
        context "When dishes of category are present" do
            it "prints a list of starters and a heading" do
                io = double(:io)
                expect(io).to receive(:puts).with("\nOur starters are:        ")
                expect(io).to receive(:puts).with(["Onion Soup: £6.50\n", "Carrot Soup: £6.50\n"])

                hotelNicholas1 = Menu.new
                hotelNicholas1.add_dish("Onion Soup", "6.50", "starter")
                hotelNicholas1.add_dish("Carrot Soup", "6.50", "starter")
                hotelNicholas1.add_dish("Rump of New Season Lamb", "16.50", "main")
                hotelNicholas1.add_dish("Devon Blue Croquettes", "14.00", "main")
                hotelNicholas1.add_dish("Apricot Sorbet", "6.00", "dessert")
                hotelMenuRead = MenuReader.new(hotelNicholas1, io)
                hotelMenuRead.print_starters
            end
            it "prints nothing when the category is empty" do
                io = double(:io)
                expect(io).not_to receive(:puts).with("\nOur starters are:        ").ordered
                
                hotelNicholas1 = Menu.new
                hotelNicholas1.add_dish("Rump of New Season Lamb", "16.50", "main")
                hotelNicholas1.add_dish("Devon Blue Croquettes", "14.00", "main")
                hotelNicholas1.add_dish("Apricot Sorbet", "6.00", "dessert")
                testReader = MenuReader.new(hotelNicholas1, io)
                testReader.print_starters
            end
        end
    end
    describe "integration #print_menu" do
        it "prints entire menu including header and footer" do
            io = double(:io)
            expect(io).to receive(:puts).with("------------------------------------------------").ordered
            expect(io).to receive(:puts).with(("Welcome to Hotel Nicholas\n").center(40)).ordered
            expect(io).to receive(:puts).with("\nOur starters are:        ").ordered
            expect(io).to receive(:puts).with(["Carrot Soup: £6.50\n"]).ordered
            expect(io).to receive(:puts).with("\nOur main dishes are:        ").ordered
            expect(io).to receive(:puts).with(["Devon Blue Croquettes: £14.00\n"]).ordered
            expect(io).to receive(:puts).with("\nOur dessert dishes are:        ").ordered
            expect(io).to receive(:puts).with(["Apricot Sorbet: £6.00\n"]).ordered
            expect(io).to receive(:puts).with("\n\n").ordered
            expect(io).to receive(:puts).with("**To place an order, please type the item \nname exactly as found in the menu.** \nThank you for visiting").ordered
            expect(io).to receive(:puts).with("------------------------------------------------\n\n").ordered

            hotelNicholas2 = Menu.new
            hotelNicholas2.add_dish("Carrot Soup", "6.50", "starter")
            hotelNicholas2.add_dish("Devon Blue Croquettes", "14.00", "main")
            hotelNicholas2.add_dish("Apricot Sorbet", "6.00", "dessert")
            testReader = MenuReader.new(hotelNicholas2, io)
            testReader.print_menu
        end
    end
end
