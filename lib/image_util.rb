module ImageUtil
  def self.image_upload(image_params,model_name,model_id)
    if image_params.present?
      image_params.each do |img|
        Image.create(image:img,target_type:model_name,target_id:model_id)
      end
    end
  end

  def self.base64_image(base_params,model_name,model_id)
    path = self.base64_cover_file(base_params,"jpg")
    image = Image.new(target_type:model_name,target_id:model_id)
    File.open(path) do |f|
      image.image = f
    end
    image.save
  end

  def self.base64_cover_file(base64_code, img_type ='jpg')
    path = Rails.root.join("public", "#{SecureRandom.random_number.to_s}.#{img_type}")
    File.open(path, 'wb') do |f|
      f.write(Base64.decode64(base64_code))
    end
    path
  end
end