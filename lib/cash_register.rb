class CashRegister
  attr_accessor :total, :discount, :items, :previousprice

  def initialize(discount = 0)
    @items = []
    @total = 0
    @discount = discount
  end

  def add_item(item, price, quantity = 1)
    count = 0
    @previousprice = price
    while count < quantity
      @items << item
      count += 1
    end

    @total = (price * quantity) + @total
  end

  def total
    @total
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total = @total * (1.to_f - (@discount.to_f/100.to_f))
      "After the discount, the total comes to $#{Integer(@total)}."
    end
  end

  def items
    @items
  end
  def void_last_transaction
    @total = @total - @previousprice
  end
end
