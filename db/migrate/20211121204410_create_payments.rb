class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    drop_table :payments
    create_table :payments do |t|
      t.string :credit_card_number
      t.decimal :amount
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
