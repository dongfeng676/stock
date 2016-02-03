module ApiHelpers
  def body_parasm
    params_ =  request.body.read.gsub("\x00","{")
    params_json = JSON.parse params_
    AppLog.info("params_json :  #{params_json}")
  end

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
require 'V1/api_category'
require 'V1/api_detail_category'
require 'V1/api_advert'
require 'V1/api_product'
require 'V1/api_user'
require 'V1/api_address'
require 'V1/api_cookie'
require 'V1/api_cart_item'
require 'V1/api_order'


class API < Grape::API
  helpers ApiHelpers
  # version 'v1', using: :header, vendor: 'sjb'
  prefix 'api'
  # content_type :json ,"application/json"
  format :json
  # use Rack::PostBodyContentTypeParser
  formatter :json, Grape::Formatter::Jbuilder
  # stock app v1.0 版本
  mount V1::ApiCategory
  mount V1::ApiAdvert
  mount V1::ApiProduct
  mount V1::ApiDetailCategory
  mount V1::ApiUser
  mount V1::ApiAddress
  mount V1::ApiCookie
  mount V1::ApiCartItem
  mount V1::ApiOrder
end