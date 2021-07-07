#require "pry"

class CashRegister

attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity = 1)
    self.total += price * quantity
    quantity.times {self.items << item}
    self.last_transaction = price * quantity
  end

  def apply_discount
    self.total *= (1 - self.discount / 100.0)
    if self.discount == 0
      "There is no discount to apply."
    else
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def void_last_transaction
    #binding.pry
    self.total -= self.last_transaction
  end

end
