class User < ApplicationRecord
  belongs_to :province

  validates :username, presence: true
  validates :password, presence: true
  validates :street_address, presence: true
  validates :province_id, presence: true
end
