class LineItem < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :cart, optional: true
  belongs_to :order, optional: true

  def total_price
    (price || 0) * quantity
  end
end
