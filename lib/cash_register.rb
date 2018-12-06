require "pry"

class CashRegister
  attr_accessor :discount, :total, :last_item_info
  attr_reader :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, total, quantity = 1)
    self.total += (total * quantity)
    quantity.times do
      self.items << title
    end
    self.last_item_info = [title, total]
  end

  def apply_discount
    if self.discount != 0
      self.total = (self.total * (1 - (self.discount.to_f / 100))).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.items.pop
    self.total -= self.last_item_info[1]
  end
end
