
class ProductsController < ApplicationController
    include CurrentCart
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    before_action :check_owner, only: [:edit, :update, :destroy]
  
    def index
      @products = Product.all.order(created_at: :desc)
    end
  
    def show
    end
  
    def new
      @product = current_user.products.build
    end
  
    def create
      @product = current_user.products.build(product_params)
      
      if @product.save
        redirect_to root_path, notice: 'Product was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @product.update(product_params)
        redirect_to @product, notice: 'Product was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @product.destroy
      before_action :check_owner, only: [:edit, :update, :destroy]
      redirect_to products_url, notice: 'Product was successfully deleted.'
    end
  
    def add_to_cart
      @product = Product.find(params[:id])
      @current_cart.add_product(@product)
      redirect_to @product, notice: 'Added to your cart'
    end
  
    private
  
    def set_product
      @product = Product.find(params[:id])
    end
  
    def check_owner
      redirect_to products_path, alert: 'Access denied.' unless @product.user == current_user
    end
  
    def product_params
      params.require(:product).permit(:title, :brand, :model, :description, :condition, :finish, :price, :color, :image)
    end
end
  