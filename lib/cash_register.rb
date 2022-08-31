require "pry"

class CashRegister
    attr_accessor :discount, :total

    def initialize (discount = 0)
        @discount = discount
        @total = 0
        @items_array = []

    end

    def add_item (title, price, qty = 1)
        

        @total += price * qty
        @last_item_price = price
        @last_item_qty = qty

        while qty > 0 do
            @items_array << title
            qty -= 1
        end

    end
    
    def apply_discount
        # prev_total = @total
        
        if @discount > 0

            discount_amount  = (@discount.fdiv(100)) * @total
            @total -= discount_amount
            "After the discount, the total comes to $#{total.round}."
            
        else 
            "There is no discount to apply."
        end
    end

    def items
        @items_array
    end

    def void_last_transaction
        @total -= @last_item_price
        @items_array.pop(@last_item_qty)
        if @items_array.empty?
            @total = 0.0
        end
    end

end
# binding.pry
