# frozen_string_literal: true

class Province < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :province_taxes, dependent: :destroy
  has_many :taxes, through: :province_taxes

  validates :name, presence: true, format: { with: /[a-zA-Z]/ }
  validates :code, presence: true, format: { with: /[a-zA-Z]/ }, length: { is: 2 }
end
