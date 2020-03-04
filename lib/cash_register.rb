
require "pry"

class CashRegister
  attr_accessor :discount, :total, :last_item_info

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, total, quantity = 1)
    self.total += (total * quantity)
    quantity.times do
      @items << title
    end
    @last_item_info = [title, total]
  end

  def apply_discount
    if @discount != 0
      self.total = (self.total * (1 - (@discount.to_f / 100))).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.items.pop
    @total -= @last_item_info[1]
  end

end
