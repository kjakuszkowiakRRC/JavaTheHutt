# frozen_string_literal: true

class ChangeOnsaleToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column(:products, :on_sale, :integer)
  end
end
