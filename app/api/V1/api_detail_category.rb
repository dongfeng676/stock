module V1
  class ApiDetailCategory < Grape::API

    version 'v1', using: :path

    resources 'detail_categories' do

      # http://localhost:3000/api/v1/detail_categories/:unique_id
      params do 
        requires :unique_id,type: String
      end
      get ":unique_id",jbuilder:"v1/detail_categories/index" do
        @detail_category = DetailCategory.find_by(unique_id:params[:unique_id])
        if @detail_category.present?
          @products = @detail_category.products
        end
      end
    end
  end
end