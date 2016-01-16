class Admin::AddressController < ApplicationController
  layout 'admin/layouts/application'
  
  def index
    @address = Address.all
  end
end
