require_relative "./Menu.rb"
require_relative "./Menu_reader.rb"

Customer = Struct.new(:contactname, :contactaddress, :contactphonenumber) do
  def initialize(io=Kernel)
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
end

Nick = Customer.new