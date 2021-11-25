class Product < ApplicationRecord
    has_one_attached :image
    belongs_to :variety
    has_many :order_product
    has_many :orders, through: :order_product

    validates :name, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
    validates :on_sale, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 2 }
    validates :variety_id, presence: true
end
