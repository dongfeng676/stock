class Order < ActiveRecord::Base
  belongs_to :address
  belongs_to :user

  def get_address
    address = self.address
    address.area.to_s + address.detail.to_s
  end
end
