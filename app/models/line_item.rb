class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def total_price
    (price || 0) * quantity
  end
end
