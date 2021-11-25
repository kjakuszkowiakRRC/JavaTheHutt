# frozen_string_literal: true

class DropUserAndPaymentsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :payments
    drop_table :users
  end
end
