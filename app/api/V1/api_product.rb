module V1
  class ApiProduct < Grape::API

    version 'v1', using: :path

    resources 'products' do

      # http://localhost:3000/api/v1/products/:id
      params do
        requires :id, type: Integer
      end
      get ":id", jbuilder: 'v1/products/show' do
        @product = Product.find(params[:id])
        @product = Product.new if @product.blank?
      end
    end
  end
end
