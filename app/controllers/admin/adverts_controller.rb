class Admin::AdvertsController < Admin::BaseController
  
  before_action :set_advert,only:[:edit,:update,:destroy,:show]
  
  def index
    @adverts = Advert.all
  end

  def new
    @advert = Advert.new
  end

  def edit
  end

  def show
  end

  def update
    image_params = params[:advert][:ads_image]
    AppLog.info("class:   #{image_params.class}")
    AppLog.info("image_params:   #{image_params}")
    ImageUtil.image_upload(image_params,"Advert",@advert.id)
    if @advert.update(advert_params)
      redirect_to admin_adverts_path
    else
      render 'edit' 
    end
  end

  def destroy
    @advert.destroy
    redirect_to admin_adverts_path
  end

  def create
    @advert = Advert.new(advert_params)
    image_params = params[:advert][:ads_image]
    @advert.unique_id = SecureRandom.urlsafe_base64
    if @advert.save
      ImageUtil.image_upload(image_params,"Advert",@advert.id)
      redirect_to admin_adverts_path
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

    def set_advert
      @advert = Advert.find(params[:id])
    end

    def advert_params
      params.require(:advert).permit(:product_id)
    end
end
