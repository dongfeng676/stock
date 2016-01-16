class Admin::BaseController < ApplicationController
  http_basic_authenticate_with name: "stock", password: "stock123"
  layout 'admin/layouts/application'
end
