# frozen_string_literal: true

class Variety < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true
end
