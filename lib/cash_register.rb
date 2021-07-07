require 'pry'
class CashRegister
  
  attr_accessor :total, :discount , :quantitiy, :last_transaction
  
  
  
  def initialize(discount = 0)
    @total = 0.0
    @discount = discount
    @@items = []
  end 
  
  def add_item(items, price, quantitiy = 1)
    @total += price * quantitiy
    @quantitiy = quantitiy
      x = 1
      while x <= quantitiy
      @@items << items
      x += 1
      end  
      @last_transaction = price*quantitiy
  end
  
  def apply_discount
    if @discount != 0
      @total -= (@total * (@discount * 0.01))
    "After the discount, the total comes to $#{@total.to_i}."
   else
      "There is no discount to apply."
   end
  end
  
  def items
    @@items
  end
  
  def void_last_transaction
    @total -= @last_transaction
  
  end
  
end
