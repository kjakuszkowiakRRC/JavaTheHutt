class Product < ApplicationRecord
    has_one_attached :image
    belongs_to :variety
    has_many :order_product
    has_many :orders, through: :order_product

    validates :name, presence: true
    # validates :price, presence: true, format: { with: /\d{1,6}(\.\d{0,2})?/  }, numericality: { greater_than: 0, less_than: 1000000 }
    validates :price, presence: true
    validates :on_sale, presence: true
    validates :variety_id, presence: true
end
