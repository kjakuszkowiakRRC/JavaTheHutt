# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :province
  has_many :orders, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
