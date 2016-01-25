module V1
  class ApiAddress < Grape::API

    version 'v1', using: :path

    resources 'addresses' do

      # http://localhost:3000/api/v1/addresses/:phone_num
      params do
        requires :phone_num, type: String
      end
      get ":phone_num", jbuilder: 'v1/addresses/index' do
        phone_num = params[:phone_num]
        @user = User.find_by(phone_num:phone_num)
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
        requires :default,type: String
      end
      post "",jbuilder: 'v1/addresses/new' do
        @user = User.find_by(phone_num:params[:phone_num])
        AppLog.info("user:  #{@user}")
        if @user.present?
          @address = Address.create(user_id:@user.id,area:params[:area],detail:params[:detail],receive_phone:params[:receive_phone],receive_name:params[:receive_name],default:params[:default])
        end
      end

      # http://localhost:3000/api/v1/addresses
      params do
        requires :receive_name,type: String
        requires :receive_phone,type: String
        requires :area,type: String
        requires :detail,type: String
        requires :unique_id,type: String
        requires :default,type: String
      end
      put "",jbuilder: 'v1/addresses/update' do
        @address = Address.find_by(unique_id:params[:unique_id])
        if @address.present?
          @address = Address.update(area:params[:area],detail:params[:detail],receive_phone:params[:receive_phone],receive_name:params[:receive_name],default:params[:default])
          @info = "success"
        end
      end

      params do 
        requires :unique_id,type:String
      end
      delete "",jbuilder:"v1/address/delete" do
        @address = Address.find_by(unique_id:params[:unique_id])
        if @address.present?
          @address.destroy
          @info = "success"
        end
      end
    end
  end
end
