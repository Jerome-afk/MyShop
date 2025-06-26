
module CurrentCart
    extend ActiveSupport::Concern
  
    included do
      before_action :set_current_cart
    end
  
    private
  
    def set_current_cart
      if user_signed_in?
        @current_cart = current_user.cart || current_user.create_cart
        
        # Merge session cart if exists
        if session[:cart_id]
          session_cart = Cart.find_by(id: session[:cart_id])
          if session_cart && session_cart != @current_cart
            merge_carts(session_cart, @current_cart)
            session_cart.destroy
            session[:cart_id] = nil
          end
        end
      else
        @current_cart = Cart.find_by(id: session[:cart_id])
        if @current_cart.nil?
          @current_cart = Cart.create
          session[:cart_id] = @current_cart.id
        end
      end
    end
  
    def merge_carts(from_cart, to_cart)
      from_cart.cart_items.each do |item|
        to_cart.add_product(item.product, item.quantity)
      end
    end
end
  