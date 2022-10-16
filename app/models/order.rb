class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }

  def address_display
    '〒' + postal_code + '' + address + '' + name
  end

  has_many :order_details
end
