class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_index, only: :index

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    @orders = Order.all
    @orders.each do |order|
      if current_user.id == @item.user_id || @item.id == order.item_id
        redirect_to root_path
        break
      end
    end
  end
end