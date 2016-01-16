class Admin::AddressesController < Admin::BaseController
  before_action :set_address,only:[:edit,:update,:destroy]
  def index
    @address = Address.all
  end

  def new
    @address = Address.new
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to admin_addresses_path
    else
      render 'edit' 
    end
  end

  def destroy
    @address.destroy
    redirect_to admin_addresses_path
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to admin_addresses_path
    else
      render 'new'
    end
  end

  private 
    def set_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:province,:city,:region,:detail,:user_id)
    end
end
