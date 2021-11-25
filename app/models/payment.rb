class Payment < ApplicationRecord
  belongs_to :order

  validates :credit_card_numer, presence: true, format: {with: /[0-9 ]/}
  validates :amount, presence: true, numericality: true
  validates :order_id, presence: true
end
