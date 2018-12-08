class CashRegister
    attr_accessor :total, :last_transaction
    attr_reader :discount, :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(item, price, quantity = 1)
        tx = price * quantity
        self.total += tx
        self.last_transaction = tx
        quantity.times { self.items << item }
    end

    def apply_discount
        if self.discount > 0
            self.total *= (1 - (self.discount.to_f / 100))
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            'There is no discount to apply.'
        end
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end
end