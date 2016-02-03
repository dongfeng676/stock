module V1
  class ApiAddress < Grape::API

    version 'v1', using: :path

    resources 'addresses' do

      # http://localhost:3000/api/v1/addresses/:token
      params do
        requires :token, type: String
      end
      get ":token", jbuilder: 'v1/addresses/index' do
        @token,@user = current_user
        if @token.present?
          @addresses = @user.addresses
        end
      end

      # http://localhost:3000/api/v1/addresses
      params do
        requires :receive_name,type: String
        requires :receive_phone,type: String
        requires :area,type: String
        requires :detail,type: String
        requires :token,type: String
        requires :default,type: String
      end
      post "",jbuilder: 'v1/addresses/new' do
        @token,@user = current_user
        if @token.present?
          if params[:default] == "1"
            address_default = Address.find_by(user_id:@user.id,default:1)
            address_default.update(default:0) if address_default.present?
          end
          @address = Address.create(user_id:@user.id,area:params[:area],detail:params[:detail],receive_phone:params[:receive_phone],receive_name:params[:receive_name],default:params[:default],unique_id:SecureRandom.urlsafe_base64)
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
        requires :token,type:String
      end
      put "",jbuilder: 'v1/addresses/update' do
        @token,@user = current_user
        if @token.present?
          @address = Address.find_by(unique_id:params[:unique_id])
          if @address.present?
             if params[:default] == "1"
              address_default = Address.find_by(user_id:@user.id,default:1)
              address_default.update(default:0) if address_default.present?
            end
            @address.update(area:params[:area],detail:params[:detail],receive_phone:params[:receive_phone],receive_name:params[:receive_name],default:params[:default])
            @info = "success"
          end
        end
      end

      #http://localhost:3000/api/v1/addresses
      params do 
        requires :unique_id,type:String
        requires :token,type:String
      end
      delete "",jbuilder:"v1/addresses/delete" do
        @token,@user = current_user
        if @token.present?
          @address = Address.find_by(unique_id:params[:unique_id])
          if @address.present?
            @address.destroy
            @info = "success"
          end
        end
      end

      #http://localhost:3000/api/v1/addresses/show/:unique_id
      params do 
        requires :unique_id,type:String
        requires :token,type:String
      end
      get "show/:unique_id",jbuilder:"v1/addresses/show" do
        AppLog.info("address:test")
        @token,@user = current_user
        if @token.present?
          @address = Address.find_by(unique_id:params[:unique_id])
        end
        AppLog.info("address:  #{@address}")
      end

      #http://localhost:3000/api/v1/addresses/default/:token
      params do 
        requires :token,type:String
      end
      get 'default/:token',jbuilder:"v1/addresses/show" do 
        @token,@user = current_user
        if @token.present?
          @address = Address.find_by(user_id:@user.id,default:1)
        end
      end
    end
  end
end
