class User < ActiveRecord::Base
  has_many :addresses
  has_many :images, as: :target
end
