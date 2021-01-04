class OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, except: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :purchese_present?, only: [:index, :create]

  def index
    @user_order = UserOrder.new
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

  def move_to_index
    redirect_to root_path unless current_user.id != @item.user_id
  end

  def set_item
    @item = Item.find(params[:item_id])    #rails routesで出たURI Patternが/items/:item_id/orders なので、paramsの中のキーは必ず :item_id になる。
  end

  def purchese_present?    # 購入済みの商品の購入ページに遷移できないし、購入処理もさせない。
    redirect_to root_path if @item.purchese.present?
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

