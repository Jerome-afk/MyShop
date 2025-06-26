
module ProductsHelper
    def seller_name(product)
      product.user.name
    end
  
    def can_edit_product?(product)
      user_signed_in? && current_user == product.user
    end
  
    def can_delete_product?(product)
      user_signed_in? && current_user == product.user
    end
end
  