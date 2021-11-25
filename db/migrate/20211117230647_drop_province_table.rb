# frozen_string_literal: true

class DropProvinceTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :provinces
  end
end
