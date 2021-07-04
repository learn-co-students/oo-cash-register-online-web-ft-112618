require 'pry'
class CashRegister
  attr_accessor :total, :items 
  attr_reader :discount
  attr_accessor :last_transaction 
  
  def initialize (discount = 0)
    @total = 0
    
    @discount = discount
    
    self.items = []
    
    self.last_transaction = []
    
  end
  
  def add_item (item, price, quantity = 1)
    @total = @total + price * quantity
    
    quantity.times do 
      self.items << item
      
    end 
    
    this_transaction = price 
    
      self.last_transaction << this_transaction
      
  end 
  
  def apply_discount
    if @discount !=0 
      
    self.total = self.total * (1 - self.discount.to_f / 100)
    "After the discount, the total comes to $#{self.total.to_i}."
    
    else 
      "There is no discount to apply."
    end 
     
  end
  
  def void_last_transaction
    
    @total = @total - last_transaction[-1]
  end 
end
