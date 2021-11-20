class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    drop_table :users
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :street_address
      t.references :province, null: false, foreign_key: true

      t.timestamps
    end
  end
end