class ProvinceTax < ApplicationRecord
  belongs_to :province
  belongs_to :tax
end
