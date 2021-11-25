class Province < ApplicationRecord
    has_many :users
    has_many :province_taxes
    has_many :taxes, through: :province_taxes

    validates :name, presence: true, format: {with: /[a-zA-Z]/}
    validates :code, presence: true, format: {with: /[a-zA-Z]/}, length: {is: 2}
end
