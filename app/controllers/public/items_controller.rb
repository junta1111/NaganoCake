class Public::ItemsController < ApplicationController
    def index
     @items = Item.all
    end
    
    def show
     @items = Item.find(params[:id])
     @cart_item = CartItem.new
    end
end
