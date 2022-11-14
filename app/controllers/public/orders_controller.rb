class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
    @order = Order.page(params[:page]).where(customer_id: current_customer.id)
    @total = 0
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.page(params[:page])
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.item_id = cart_item.item_id
      @order_details.order_id = @order.id
      @order_details.price = cart_item.item.with_tax_price
      @order_details.amount = cart_item.amount
      @order_details.save
      current_customer.cart_items.destroy_all
    end
    redirect_to orders_complete_path
  end

  def confirm
    @order = Order.new(order_params)
    @total = 0
    @cart_items = CartItem.all
    @order.shipping_cost = 800
    select_address = params[:order][:select_address]
    if select_address == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif select_address == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end

  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment)
  end

end
