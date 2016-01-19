class SubCategory < ActiveRecord::Base
  belongs_to :category
  has_many :adverts
  has_many :products
  has_many :detail_categories
end
