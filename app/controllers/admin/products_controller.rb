class Admin::ProductsController < Admin::BaseController

  before_action :set_product,only:[:edit,:update,:destroy,:show]
  
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def update
    image_params = params[:product][:image]
    if @product.update(product_params)
        image_upload(image_params,"Product",@product.id)
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
    image_params = params[:product][:image]
    if @product.save
      image_upload(image_params,"Product",@product.id)
      redirect_to admin_products_path
    else
      render 'new'
    end
  end

  private
    def image_upload(image_params,model_name,model_id)
      image_params.each do |img|
        Image.create(image:img,target_type:model_name,target_id:model_id)
      end
    end 
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name,:state,:unit_id,:stock_num,:price,:old_price,:sub_category_id,:hot_category_id)
    end
end
