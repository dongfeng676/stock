module V1
  class ApiCookie < Grape::API

    version 'v1', using: :path

    resources 'cookies' do

      # http://localhost:3000/api/v1/cookies
      get "", jbuilder: 'v1/cookies/index' do
        a = "aaa"
        cookies[a] = "bbbb"
        cookies[:test] = "test123"
        # @cookie = cookies[:test]
        @cookie = cookies[a]
      end
      # http://localhost:3000/api/v1/cookies/test
      get "test", jbuilder: 'v1/cookies/index' do
        # @cookie = cookies[:test]
        a = "aaa"
        @cookie = cookies[a]
      end
    end
  end
end
