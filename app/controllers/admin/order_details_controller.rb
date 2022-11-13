class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail= OrderDetail.find(params[:id])
    @order = @order_detail.order_id
    @orders = @order_detail.order
    @order_details = @orders.order_details
    @order_detail.update(order_detail_params)
    if params[:order_detail][:making_status] == "production"
      @order_detail.order.update(status: 2)
    elsif @order_details.count == @order_details.where(making_status: "conclusion").count
      @order_detail.order.update(status: 3)
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
