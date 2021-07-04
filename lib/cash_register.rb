class CashRegister
  attr_accessor :total, :discount, :title, :quantity
  
  def initialize(discount = 0, total = 0)
    @discount = discount
    @total = total
    @items = []
  end
 
  def add_item(title, price, quantity = 1)
    quantity.times {|item| @items << title}
    @total = total + price * quantity
  end
  
  def items
    @items.compact
  end
  
  def apply_discount
    if discount != 0
      self.total = (total * ((100.0 - discount.to_f)/100)).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end
 
 def void_last_transaction
   @total = total - @total
 end
  
end

