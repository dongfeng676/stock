module V1
  class ApiDetailCategory < Grape::API

    version 'v1', using: :path

    resources 'detail_categories' do

      # http://localhost:3000/api/v1/detail_categories/:id
      params do 
        requires :id,type: Integer
      end
      get ":id",jbuilder:"v1/detail_categories/index" do
        @detail_category = DetailCategory.find(params[:id])
        if @detail_category.present?
          @products = @detail_category.products
        else
          @detail_categoriy = DetailCategory.new
        end
      end
    end
  end
end