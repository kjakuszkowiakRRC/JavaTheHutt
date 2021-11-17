# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Variety.delete_all
# Product.delete_all
ProvinceTax.delete_all
Province.delete_all
Tax.delete_all

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

# for i in 0..5 do
#     Variety.create(name: Faker::Coffee.unique.variety)
# end

# for i in 0..ran(10) do
#     Product.create(name: "TESTER", price: 3.50)
# end

