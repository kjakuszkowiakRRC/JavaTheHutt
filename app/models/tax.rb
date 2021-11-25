# frozen_string_literal: true

class Tax < ApplicationRecord
  has_many :province_taxes, dependent: :destroy
  has_many :provinces, through: :province_taxes

  validates :name, presence: true, format: { with: /[a-zA-Z]/ }
  validates :amount, presence: true, numericality: true
end
