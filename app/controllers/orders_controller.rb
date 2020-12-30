class OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])    #rails routesで出たURI Patternが/items/:item_id/orders なので、paramsの中のキーは必ず :item_id になる。
    @user_order = UserOrder.new
    unless current_user.id != @item.user_id
      redirect_to root_path
    end
  end


  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  # すべてのストロングパラメーターを統合
  def order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :city, :address, :phone_number, :building, :purchese).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
  end


  # 購入情報をPayjpに送信する処理
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,  # 
      card: order_params[:token],     # カードトークン
      currency: 'jpy'                 # 通貨の種類
    )
  end
end

