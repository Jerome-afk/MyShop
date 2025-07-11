
class CartsController < ApplicationController
    include CurrentCart
    before_action :set_cart, only: [:show, :destroy, :remove_item]
  
    def show
      @cart = @current_cart
      @products = @cart.products
      @total_price = @cart.total_price
      @total_items = @cart.total_items
      @shipping_cost = 5.00 # Example fixed shipping cost
      @final_total = @total_price + @shipping_cost
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

    def add_item
      product = Product.find(params[:product_id])
      @cart.add_product(product)
      redirect_to @cart, notice: 'Added to your cart'
    end
  
    private
  
    def set_cart
      @cart = @current_cart
    end
end
  