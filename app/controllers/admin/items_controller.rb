class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to show_item_path(@item.id)
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to show_item_path(@item.id)
  end
  
  def item_params
    params.require(:item).permit(:name, :introduction, :genre_id, :price, :is_active)
  end
end