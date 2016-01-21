module V1
  class ApiAddress < Grape::API

    version 'v1', using: :path

    resources 'addresses' do

      # http://localhost:3000/api/v1/addresses/:phone_num
      params do
        requires :phone_num, type: String
      end
      get ":phone_num", jbuilder: 'v1/addresses/index' do
        require 'digest/md5'
        encode_num = Digest::MD5.hexdigest(params[:phone_num])
        @user = User.find_by(user_id:encode_num)
        if @user.present?
          @addresses = @user.addresses
        end
      end

      # http://localhost:3000/api/v1/addresses
      params do
        requires :receive_name,type: String
        requires :receive_phone,type: String
        requires :area,type: String
        requires :detail,type: String
        requires :phone_num,type: String
      end
      post "",jbuilder: 'v1/addresses/new' do
        encode_num = Digest::MD5.hexdigest(params[:phone_num])
        @user = User.find_by(user_id:encode_num)
        if @user.present?
          @address = Address.create(user_id:@user.id,area:params[:area],detail:params[:detail],receive_phone:params[:receive_phone],receive_name:params[:receive_name])
        end
      end
    end
  end
end
