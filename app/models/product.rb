
class Product < ApplicationRecord
    belongs_to :user
    has_many :cart_items, dependent: :destroy
  
    validates :title, presence: true
    validates :price, presence: true, numericality: { greater_than: 0 }
    validates :brand, presence: true
    validates :condition, presence: true
  
    mount_uploader :image, ImageUploader
  
    BRANDS = ['Apple', 'Samsung', 'Nike', 'Adidas', 'Toyota', 'Ford', 'Other'].freeze
    CONDITIONS = ['New', 'Like New', 'Good', 'Fair', 'Poor'].freeze
    COLORS = ['Black', 'White', 'Red', 'Blue', 'Green', 'Yellow', 'Gray', 'Other'].freeze
end
  