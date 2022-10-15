class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
  end

  def show
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to orders_complete_path
  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    @total = 0
    @cart_items = CartItem.all
    @order.shipping_cost = 800
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

end
