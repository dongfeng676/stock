class Image < ActiveRecord::Base
  belongs_to :target, polymorphic: true
end
