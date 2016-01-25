module V1
  class ApiUser < Grape::API

    version 'v1', using: :path

    resources 'users' do

      # http://localhost:3000/api/v1/users/user_info
      params do
        requires :phone_num, type: String
      end
      post "user_info", jbuilder: 'v1/users/show' do
        phone_num_encrypt = params[:phone_num]
        @user = User.find_by(phone_num:phone_num_encrypt)
      end

      # http://localhost:3000/api/v1/users/send_sms
      params do
        requires :phone_num, type: String
      end
      post 'send_sms',jbuilder:"v1/users/send_sms" do
        phone_num_encrypt = params[:phone_num]
        @info = Sms.send_sms(phone_num_encrypt)
        AppLog.info("info:#{@info}")
      end

      #http://localhost:3000/api/v1/users/sign_in
      params do
        requires :phone_num, type: String
        requires :rand_code, type: String
      end
      post "sign_in",jbuilder:"v1/users/sign_in" do
        phone_num_encrypt = params[:phone_num]
        rand_code = params[:rand_code]
        @token = User.sign_in(phone_num_encrypt,rand_code)
        if @token.present?
          cookies[phone_num_encrypt] = {value:@token,expires:10.day.from_now}
        end
      end

      #http://localhost:3000/api/v1/users/token
      params do
        requires :phone_num, type: String
      end
      post 'token',jbuilder:"v1/users/token" do
        phone_num_encrypt = params[:phone_num]
        user = User.find_by(phone_num:phone_num_encrypt)
        AppLog.info("user:  #{user.attributes}")
        if user.present?
          @token = cookies[phone_num_encrypt]
          AppLog.info("token: #{cookies[phone_num_encrypt]}")
          if @token.present?
            token = SecureRandom.urlsafe_base64
            cookies[phone_num_encrypt] = {value:token,expires:10.day.from_now}
            user.update(token:token)
          end
        else
          @token = nil
        end
      end

      #http://localhost:3000/api/v1/users
      params do
        requires :phone_num, type: String
        requires :new_phone_num,type:String
        requires :user_name, type: String
        requires :head_portrait,type:String
      end
      put '',jbuilder:"v1/users/update" do 
        phone_num_encrypt = params[:phone_num]
        @user = User.find_by(phone_num:phone_num_encrypt)
        if @user.present?
          ActiveRecord::Base.transaction do
            @user.update(phone_num:params[:new_phone_num],user_name:params[:user_name])
            @user.images.destroy_all
            ImageUtil.image_upload(params[:head_portrait],"User",@user.id)
            @flag = "1"
          end
        end
      end
    end
  end
end
