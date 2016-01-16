class Admin::HotCategoriesController < ApplicationController

  layout 'admin/layouts/application'
  before_action :set_hot_category,only:[:edit,:update,:destroy]
  
  def index
    @categories = HotCategory.all
  end

  def new
    @category = HotCategory.new
  end

  def edit
  end

  def update
    if @category.update(category_params)
        redirect_to admin_hot_categories_path
      else
        render 'edit' 
      end
  end

  def destroy
    @category.destroy
    redirect_to admin_hot_categories_path
  end

  def create
    @category = HotCategory.new(category_params)
    if @category.save
      redirect_to admin_hot_categories_path
    else
      render 'new'
    end
  end

  private 
    def set_hot_category
      @category = HotCategory.find(params[:id])
    end

    def category_params
      params.require(:hot_category).permit(:name,:desc)
    end
end
