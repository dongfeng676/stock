module V1
  class ApiUser < Grape::API

    version 'v1', using: :path

    resources 'users' do

      # http://localhost:3000/api/v1/users/user_info
      params do
        requires :phone_num, type: String
      end
      post "user_info", jbuilder: 'v1/users/show' do
        require 'digest/md5'
        encode_num = Digest::MD5.hexdigest(params[:phone_num])
        @user = User.find_by(user_id:encode_num)
        @user = User.new if @user.blank?
      end

      # http://localhost:3000/api/v1/users/send_sms
      params do
        requires :phone_num, type: String
      end
      post 'send_sms',jbuilder:"v1/users/send_sms" do
        phone_num_encrypt = params[:phone_num]
        reponse = Sms.send_sms(phone_num_encrypt)
        @info = 0
        if response["code"] == "0"
          @info = 1
          $redis.set(mobile_encrypt,rand)
          $redis.set(mobile_encrypt,1800)
        end
      end

      params do
        requires :phone_num, type: String
        requires :rand_code, type: String
      end
      post "sign_in",jbuilder:"v1/users/sign_in" do
        phone_num_encrypt = params[:phone_num]
        rand_code = params[:rand_code]
      end
    end
  end
end
