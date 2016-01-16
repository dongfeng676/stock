class Admin::SubCategoriesController < ApplicationController
  layout 'admin/layouts/application'
  before_action :set_sub_category,only:[:edit,:update,:destroy]
  
  def index
    @categories = SubCategory.all
  end

  def new
    @category = SubCategory.new
  end

  def edit
  end

  def update
    if @category.update(category_params)
        redirect_to admin_sub_categories_path
      else
        render 'edit' 
      end
  end

  def destroy
    @category.destroy
    redirect_to admin_sub_categories_path
  end

  def create
    @category = SubCategory.new(category_params)
    if @category.save
      redirect_to admin_sub_categories_path
    else
      render 'new'
    end
  end

  private 
    def set_sub_category
      @category = SubCategory.find(params[:id])
    end

    def category_params
      params.require(:sub_category).permit(:name,:desc,:category_id)
    end
end
