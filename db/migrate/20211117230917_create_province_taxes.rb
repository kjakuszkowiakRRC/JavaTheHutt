class CreateProvinceTaxes < ActiveRecord::Migration[6.1]
  def change
    create_table :province_taxes do |t|
      t.references :province, null: false, foreign_key: true
      t.references :tax, null: false, foreign_key: true

      t.timestamps
    end
  end
end
