class User < ActiveRecord::Base
  has_many :addresses
  has_many :images, as: :target

  def self.sign_in(phone_num_encrypt,rand_code)
    redis_rand_code = $redis.get(phone_num_encrypt)
    if redis_rand_code == rand_code
      #1.验证正确,存入cookies.
      token = SecureRandom.urlsafe_base64
      user = User.find_by(phone_num:phone_num_encrypt)
      if user.present?
        user.update(token:token)
      else
        User.create(token:token,phone_num:phone_num_encrypt,unique_id:SecureRandom.urlsafe_base64)
      end
    else
      token = nil
    end
    token
  end
end
