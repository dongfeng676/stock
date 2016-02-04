module V1
  class ApiOrder < Grape::API

    version 'v1', using: :path

    resources 'orders' do
      # http://localhost:3000/api/v1/orders
      # bcb67d8860d033061090fbbf9f4c605c
      params do 
        requires :token,type: String
        requires :state,type: String
      end
      get "",jbuilder:"v1/orders/index" do
        @token,@user = current_user
        if @token.present?
          state_json = JSON.parse(params[:state].gsub("\\",""))
          @orders = Order.where(state:state_json)
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
          products_json = params[:products].gsub("\\","")
          AppLog.info("products_json : #{products_json}")
          @order = Order.create(state:0,phone_num:params[:phone_num],receive_name:params[:receive_name],products:products_json,user_id:@user.id,address_id:address_id,order_money:params[:money])
        end
      end

      #http://localhost:3000/api/v1/orders/:unique_id
      params do 
        requires :token,type:String
        requires :unique_id,type:String
      end
      get ":unique_id",jbuilder:"v1/orders/show" do
        @token,@user = current_user
        if @token.present?
          @order = Order.find_by(unique_id:params[:unique_id])
        end
      end
    end
  end
end
