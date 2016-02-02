module V1
  class ApiCategory < Grape::API

    version 'v1', using: :path

    resources 'categories' do
      # http://localhost:3000/api/v1/categories
      get "", jbuilder: 'v1/categories/index' do
        @categories = Category.all
        @category = @categories.first
      end

      # http://localhost:3000/api/v1/categories/:unique_id
      params do 
        requires :unique_id,type: String
      end
      get ":unique_id",jbuilder:"v1/categories/show" do
        @category = Category.find_by(unique_id:params[:unique_id])
      end
    end
  end
end
