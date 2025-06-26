
class CartsController < ApplicationController
    include CurrentCart
    before_action :set_cart, only: [:show, :destroy, :remove_item]
  
    def show
    end
  
    def destroy
      @cart.clear
      redirect_to root_path, notice: 'Your cart is now empty'
    end
  
    def remove_item
      product = Product.find(params[:product_id])
      @cart.remove_product(product)
      redirect_to @cart, notice: 'Removed from your cart'
    end
  
    private
  
    def set_cart
      @cart = @current_cart
    end
end
  