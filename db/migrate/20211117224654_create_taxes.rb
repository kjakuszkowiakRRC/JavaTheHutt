class CreateTaxes < ActiveRecord::Migration[6.1]
  def change
    create_table :taxes do |t|
      t.string :name
      t.decimal :amount

      t.timestamps
    end
  end
end
