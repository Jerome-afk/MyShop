
class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  def total_price
    cart_items.sum { |item| item.quantity * item.product.price }
  end

  def total_items
    cart_items.sum(:quantity)
  end

  def add_product(product, quantity = 1)
    current_item = cart_items.find_by(product: product)
    if current_item
      current_item.quantity += quantity
      current_item.save
    else
      cart_items.create(product: product, quantity: quantity)
    end
  end

  def remove_product(product)
    cart_items.find_by(product: product)&.destroy
  end

  def clear
    cart_items.destroy_all
  end
end
