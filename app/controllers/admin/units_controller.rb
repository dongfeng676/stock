class Admin::UnitsController < ApplicationController
  layout 'admin/layouts/application'
  before_action :set_unit,only:[:edit,:update,:destroy]
  
  def index
    @units = Unit.all
  end

  def new
    @unit = Unit.new
  end

  def edit
  end

  def update
    if @unit.update(unit_params)
        redirect_to admin_units_path
      else
        render 'edit' 
      end
  end

  def destroy
    @unit.destroy
    redirect_to admin_units_path
  end

  def create
    @unit = Unit.new(unit_params)
    if @unit.save
      redirect_to admin_units_path
    else
      render 'new'
    end
  end

  private 
    def set_unit
      @unit = Unit.find(params[:id])
    end

    def unit_params
      params.require(:unit).permit(:name)
    end
end
