require 'pry'
class CashRegister

    attr_accessor :discount, :total

    def initialize(discount = 0)
        @total = 0.0
        @discount = discount
        @items = []
    end

    def items 
        @items.map {|item| item[:title]}
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        quantity.times do
            @items << {title: title, price: price, quantity: quantity}
        end
    end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else
            @total = @total - (@total * (@discount.to_f / 100))
            "After the discount, the total comes to $#{@total.round}."
        end
    end

    def void_last_transaction
        @total -= @items[-1][:price] * @items[-1][:quantity]
        @items.pop
    end

end
