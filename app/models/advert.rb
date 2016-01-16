class Advert < ActiveRecord::Base
  belongs_to :product
  belongs_to :sub_category
  has_many :images, as: :target
end
