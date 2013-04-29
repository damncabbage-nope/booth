class OrdersController < ApplicationController
  respond_to :html

  before_filter :require_login, :only => [:index, :show]

  def index
    render :json => current_or_guest_user
  end

#  def show
#    @order = current_user.orders.find(params[:id])
#    respond_with(@order)
#  end
#
#  def edit
#    @order = current_order
#    respond_with(@order)
#  end
#
#  def update
#    @order = current_order
#    @order.update_attributes(params[:order])
#    respond_with(@order)
#  end
#
#  def populate
#    @order = current_order
#    # TODO: PopulateOrder.with_product_ids(@order, ...)
#  end

end
