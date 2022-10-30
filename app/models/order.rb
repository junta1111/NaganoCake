class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { wait_payment: 0, payment_confirmation: 1, production: 2, prepped: 3, already: 4 }

  def address_display
    '〒' + postal_code + '' + address + '' + name
  end

  has_many :order_details
  belongs_to :customer
end
