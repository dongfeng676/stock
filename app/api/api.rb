module ApiHelpers
  def body_parasm
    params_ =  request.body.read.gsub("\x00","{")
    params_json = JSON.parse params_
  end
end
require 'V1/api_category'
require 'V1/api_advert'
require 'V1/api_product'


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
end