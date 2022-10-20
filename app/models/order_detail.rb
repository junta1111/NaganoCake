class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum making_status: { not_production: 0, wait: 1, production: 2, conclusion: 3 }

end
