module ImageUtil
  def self.image_upload(image_params,model_name,model_id)
    if image_params.present?
      image_params.each do |img|
        Image.create(image:img,target_type:model_name,target_id:model_id)
      end
    end
  end 
end