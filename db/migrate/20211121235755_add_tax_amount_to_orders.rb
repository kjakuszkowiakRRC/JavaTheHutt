# frozen_string_literal: true

class AddTaxAmountToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :tax_amount, :decimal
  end
end
