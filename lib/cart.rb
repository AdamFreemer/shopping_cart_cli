class Cart
  require_relative './item.rb'
  require 'pry'

  def initialize(items)
    @items = items
  end

  attr_accessor :items
end