class Tax < ApplicationRecord
    has_many :province_taxes
    has_many :provinces, through: :province_taxes
end
