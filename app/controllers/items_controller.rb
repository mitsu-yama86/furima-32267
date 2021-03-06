class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :purchese_present?, only: [:edit]

  def index
    @items = Item.order("created_at DESC").includes(:user) #order("created_at DESC")で、新しく投稿された分から表示する様に並べ替えている
  end   
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :text, :category_id, :state_id, :burden_id, :prefecture_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def purchese_present?    # 購入済みの商品の購入ページに遷移できないし、購入処理もさせない。
    redirect_to root_path if @item.purchese.present?
  end
end
