module V1
  class ApiCategory < Grape::API

    version 'v1', using: :path

    resources 'categories' do
      # http://localhost:3000/api/v1/categories
      get "", jbuilder: 'v1/categories/index' do
        @categories = Category.all
      end
    end
  end
end
