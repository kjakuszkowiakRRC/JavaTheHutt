# frozen_string_literal: true

class AddVarietiesToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :variety, null: false, foreign_key: true
  end
end
