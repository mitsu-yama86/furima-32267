class ItemsController < ApplicationController

  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item.params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

end
