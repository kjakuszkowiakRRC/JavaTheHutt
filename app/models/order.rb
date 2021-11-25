class Order < ApplicationRecord
  belongs_to :user
  has_one :payment
  has_many :order_product
  has_many :products, through: :order_product

  validates :price, presence: true, numericality: true
  validates :user_id, presence: true
  validates :tax_amount, numericality: true

end
