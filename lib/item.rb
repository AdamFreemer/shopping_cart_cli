class Item
  def initialize(description, price, qty)
    @description = description
    @price = price
    @qty = qty
  end
  
  attr_accessor :items
end