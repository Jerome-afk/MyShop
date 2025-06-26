
class StoreController < ApplicationController
    include CurrentCart
  
    def index
      @products = Product.all.order(created_at: :desc)
    end
end
  