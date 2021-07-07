require 'pry'
class CashRegister

  attr_accessor :items, :quantity, :price, :discount, :total, :last_transaction

  # @@items = {}

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = [ ]
   end

  def add_item(item, price, quantity = 1)
    self.total += price*quantity
    quantity.times{ self.items << item }
    self.last_transaction = price*quantity
  end

 def apply_discount
   # binding.pry
    if self.discount == 0
      "There is no discount to apply."
    else
    self.total -= self.total*(discount.to_f/100)
    "After the discount, the total comes to $#{self.total.to_i}."
  end
 end

 def void_last_transaction
   self.total -= self.last_transaction
 end

end
