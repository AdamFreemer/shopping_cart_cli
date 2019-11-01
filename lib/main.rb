class Main
  require_relative './item.rb'
  require_relative './cart.rb'

  class << self
    def create_cart
      run_welcome
      @cart = Cart.new
      items = []
      item_data = ''
      while item_data != "exit" do
        item_data = get_input("#### Please enter new item > ")
        return if item_data == 'exit'
        parse_item(item_data)
      end
    end

    def process_order
      @subtotal = 0
      ObjectSpace.each_object(Item).each do |line_item|
        binding.pry
        line_total = line_item.price * line_item.qty
        @subtotal = @subtotal + line_total
        puts "subtotal: #{@subtotal}"
      end  
    end

    def parse_item(item)
      item_array = item.split(' at ')
      item_qty = item_array[0][/\d+/].to_i
      item_description = item_array[0].split(' ')[1].strip
      item_price = item_array[1].to_f
      
      Item.send(:new, item_description, item_price, item_qty)
    end

    def get_input(prompt)
      print "#{prompt}"
      @item = gets.strip
    end

    def run_welcome
      puts "#####  Welcome to the Shopping Cart                     #####"
      puts "#####  Please enter your item in the following format:  #####"
      puts "#####  (qty) (description) at (price)                   #####"
      puts "#####  Example: 4 books at 12.49                        #####\n\n"
    end    
  end
end