class User < ActiveRecord::Base
  has_many :address
  has_many :images, as: :target
end
