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
    @cart_items.each do |cart_item|
    OrderDetail.create!(order_id: 1, item_id: 1, amount: 1, price: 1)
    end
    redirect_to orders_complete_path
  end

  def confirm
    @order = Order.new(order_params)
    @total = 0
    @cart_items = CartItem.all
    @order.shipping_cost = 800
    @order.total_payment = @order.shipping_cost + @total
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
