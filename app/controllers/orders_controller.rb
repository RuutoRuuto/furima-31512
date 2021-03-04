class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render 'index'
    end
  end

  private

  def order_params
    params.permit.merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
