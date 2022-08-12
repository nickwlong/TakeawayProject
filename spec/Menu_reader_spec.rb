require "Menu_reader"

RSpec.describe MenuReader do
    it "Checks formatted string returned from Menu class" do
        io = double(:io)
        expect(io).to receive(:puts).with("\nOur starters are:        ").ordered
        expect(io).to receive(:puts).with("Onion Soup: £6.50").ordered

        menudouble = double(:menu, string_dishes_with_prices: "Onion Soup: £6.50")
        testReader = MenuReader.new(menudouble, io)
        testReader.print_starters
    end
    it "Skips printing of a category if the category has no dishes"
        io = double(:io)
        expect(io).to receive(:puts).with("\nOur starters are:        ").ordered
        expect(io).to receive(:puts).with("Onion Soup: £6.50").ordered
    end
end