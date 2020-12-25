class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  #def destroy
    #item = Item.find(params[:id])
    #item.destroy
    #redirect_to root_path
  #end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :text, :category_id, :state_id, :burden_id, :prefecture_id, :day_id, :price).merge(user_id: current_user.id)
  end
end
