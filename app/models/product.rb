class Product < ApplicationRecord
    belongs_to :variety

    validates :name, presence: true
    validates :price, presence: true, format: { with: /\d{1,6}(\.\d{0,2})?/  }, numericality: { greater_than: 0, less_than: 1000000 }
end
