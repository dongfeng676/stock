class Product < ActiveRecord::Base
  belongs_to :sub_category
  belongs_to :hot_category
  has_many :images, as: :target
  belongs_to :unit
  has_many :adverts
  belongs_to :detail_category
  has_one :cart_item
  scope :state, -> {where(state:1)}
  scope :paged_list, ->(p,n){ page(p).per(n) } 
end
