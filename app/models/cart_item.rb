
class CartItem < ApplicationRecord
    belongs_to :cart
    belongs_to :product
  
    validates :quantity, presence: true, numericality: { greater_than: 0 }
  
    def total_price
      quantity * product.price
    end
end
  