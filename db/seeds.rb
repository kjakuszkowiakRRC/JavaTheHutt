# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all
# Variety.delete_all
# ProvinceTax.delete_all
# Province.delete_all
# Tax.delete_all

require "csv"

# tax_csv_file_location = Rails.root.join('db/Taxes.csv')
# csv_data = File.read(tax_csv_file_location)
# taxes = CSV.parse(csv_data, headers: true)

# taxes.each do |tax|

#   Tax.create(name: tax[0],
#              amount: tax[1])

# end

# province_csv_file_location = Rails.root.join('db/Provinces.csv')
# csv_data = File.read(province_csv_file_location)
# provinces = CSV.parse(csv_data, headers: true)

# provinces.each do |province|

#   Province.create(name: province[0],
#              code: province[1])

# end

# province_taxes_csv_file_location = Rails.root.join('db/Province_Taxes.csv')
# csv_data = File.read(province_taxes_csv_file_location)
# province_taxes = CSV.parse(csv_data, headers: true)

# province_taxes.each do |province_tax|

#     ProvinceTax.create(province_id: province_tax[0],
#                        tax_id: province_tax[1])

# end

# for i in 0..4 do
#     Variety.create(name: Faker::Coffee.unique.variety)
#     puts Variety.count
# end

for i in 0..99 do
    variety_record = Variety.order("RANDOM()").first()
    # is_on_sale_generator = rand(1..2)
    # is_on_sale = ""
    # if is_on_sale_generator == 1
    #     is_on_sale = "No"
    # else
    #     is_on_sale = "Yes"
    # end
    # puts(is_on_sale)
    variety_record.products.create(name: Faker::Coffee.unique.blend_name,
                                  price: Faker::Number.decimal(l_digits:2),
                                  on_sale: rand(1..2),
                                  description: Faker::Coffee.unique.notes)
end

# for i in 0..ran(10) do
#     Product.create(name: "TESTER", price: 3.50)
# end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?