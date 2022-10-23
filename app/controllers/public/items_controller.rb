class Public::ItemsController < ApplicationController
    def index
     @items = Item.page(params[:page])
    end

    def show
     @items = Item.find(params[:id])
     @cart_item = CartItem.new
    end
end
