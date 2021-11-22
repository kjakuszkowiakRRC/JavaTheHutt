class Province < ApplicationRecord
    has_many :users
    has_many :province_taxes
    has_many :taxes, through: :province_taxes
end
