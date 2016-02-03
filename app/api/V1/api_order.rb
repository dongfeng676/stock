module V1
  class ApiOrder < Grape::API

    helpers do 
      def current_user
        user_token = params[:token]
        AppLog.info("user_token:    #{user_token}")
        @user = User.find_by(token:user_token)
        if @user.present?
          AppLog.info("user_unique_id : #{@user.unique_id}")
          redis_token = @user.phone_num.to_s + @user.unique_id.to_s
          AppLog.info("redis_token:  #{redis_token}")
          @token = $redis.get(redis_token)
          AppLog.info("token is :#{@token}")
        end
        [@token,@user]
      end
    end

    version 'v1', using: :path

    resources 'orders' do
      # http://localhost:3000/api/v1/orders/:token
      # bcb67d8860d033061090fbbf9f4c605c
      params do 
        requires :token,type: String
        requires :state,type: String
      end
      get ":token",jbuilder:"v1/orders/index" do
        @token,@user = current_user
        if @token.present?
          @orders = Order.where("state = ?",params[:state])
        end
      end

      #http://localhost:3000/api/v1/orders
      params do 
        requires :token,type:String
        requires :receive_name,type:String
        requires :phone_num,type:String
        requires :address_id,type:String
        requires :products,type:String
        requires :money,type:String
      end
      post "",jbuilder:"v1/orders/create" do
        @token,@user = current_user
        if @token.present?
          AppLog.info("products : #{params[:products]}")
          address = Address.find_by(unique_id:params[:address_id])
          address_id = address.present? ? address.id : nil
          products = body_parasm
          @order = Order.create(state:0,phone_num:params[:phone_num],receive_name:params[:receive_name],products:products,user_id:@user.id,address_id:address_id,order_money:params[:money])
        end
      end
    end
  end
end
