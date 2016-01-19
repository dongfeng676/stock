class Image < ActiveRecord::Base
  belongs_to :target, polymorphic: true
  mount_uploader :image, ImageUploader

  def self.get_images(instance)
    image_urls = instance.images.map do |image|
      image.image.url
    end
  end
end
