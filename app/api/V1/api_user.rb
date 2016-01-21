module V1
  class ApiUser < Grape::API

    version 'v1', using: :path

    resources 'users' do

      # http://localhost:3000/api/v1/users/:phone_num
      params do
        requires :phone_num, type: String
      end
      get ":phone_num", jbuilder: 'v1/users/show' do
        require 'digest/md5'
        encode_num = Digest::MD5.hexdigest(params[:phone_num])
        @user = User.find_by(user_id:encode_num)
        @user = User.new if @user.blank?
      end
    end
  end
end
