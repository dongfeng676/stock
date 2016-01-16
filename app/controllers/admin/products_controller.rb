class Admin::ProductsController < ApplicationController
  layout 'admin/layouts/application'
  before_action :set_product,only:[:edit,:update,:destroy]
  
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def update
    if @product.update(product_params)
        redirect_to admin_products_path
      else
        render 'edit' 
      end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path
    else
      render 'new'
    end
  end

  private 
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name,:desc)
    end
end
