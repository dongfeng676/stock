module V1
  class ApiCategory < Grape::API

    version 'v1', using: :path

    resources 'categories' do
      get "", jbuilder: 'v1/categories/index' do
        @categories = Category.all
      end
    end
  end
end
