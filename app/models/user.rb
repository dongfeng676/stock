class User < ActiveRecord::Base
  has_many :addresses
  has_many :images, as: :target
  has_many :cart_items

  def self.sign_in(phone_num_encrypt,rand_code)
    redis_rand_code = $redis.get(phone_num_encrypt)
    if redis_rand_code == rand_code
      #1.验证正确,存入cookies.
      token = SecureRandom.urlsafe_base64
      user = User.find_by(phone_num:phone_num_encrypt)
      if user.present?
        user.update(token:token)
      else
        user = User.create(token:token,phone_num:phone_num_encrypt,unique_id:SecureRandom.urlsafe_base64,rand:"铜")
      end
      unique_id = user.unique_id
    else
      token = nil
    end
    [token,unique_id]
  end
end
