class Admin::OrdersController < ApplicationController
  layout 'admin/layouts/application'
  
  def index
    @orders = Order.all
  end
end