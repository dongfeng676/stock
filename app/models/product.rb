class Product < ActiveRecord::Base
  belongs_to :sub_category
  belongs_to :hot_category
  has_many :images, as: :target
end
