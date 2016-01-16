class Image < ActiveRecord::Base
  belongs_to :target, polymorphic: true
  mount_uploader :image, ImageUploader
end
