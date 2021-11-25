# frozen_string_literal: true

class AddOnSaleToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :on_sale, :integer
  end
end
