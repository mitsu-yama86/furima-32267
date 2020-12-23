class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.order("created_at DESC") #order("created_at DESC")で、新しく投稿された分から表示する様に並べ替えている
  end   
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new#create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
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
