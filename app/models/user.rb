class User < ActiveRecord::Base
  has_many :addresses
  has_many :images, as: :target

  def sign_in(phone_num_encrypt,rand_code)
  end
end
