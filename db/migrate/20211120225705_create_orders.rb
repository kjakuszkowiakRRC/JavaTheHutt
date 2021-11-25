# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.decimal :price
      t.datetime :shipped_date
      t.string :status
      t.datetime :paid_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
