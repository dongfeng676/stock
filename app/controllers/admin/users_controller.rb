class Admin::UsersController < ApplicationController
  layout 'admin/layouts/application'
  
  def index
    @users = User.all
  end
end
