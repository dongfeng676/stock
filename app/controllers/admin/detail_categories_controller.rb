class Admin::DetailCategoriesController < Admin::BaseController

  before_action :set_detail_category,only:[:edit,:update,:destroy]
  
  def index
    @categories = DetailCategory.all
  end

  def new
    @category = DetailCategory.new
  end

  def edit
  end

  def update
    if @category.update(category_params)
        redirect_to admin_detail_categories_path
      else
        render 'edit' 
      end
  end

  def destroy
    @category.destroy
    redirect_to admin_detail_categories_path
  end

  def create
    @category = DetailCategory.new(category_params)
    if @category.save
      redirect_to admin_detail_categories_path
    else
      render 'new'
    end
  end

  private 
    def set_detail_category
      @category = DetailCategory.find(params[:id])
    end

    def category_params
      params.require(:detail_category).permit(:name,:desc,:sub_category_id)
    end
end
