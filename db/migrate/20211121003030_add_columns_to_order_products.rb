# frozen_string_literal: true

class AddColumnsToOrderProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :order_products, :bought_price, :decimal, null: false
    add_column :order_products, :quantity, :integer, null: false
  end
end
