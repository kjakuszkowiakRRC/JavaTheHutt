class CreateVarieties < ActiveRecord::Migration[6.1]
  def change
    drop_table :varieties
    create_table :varieties do |t|
      t.string :name

      t.timestamps
    end
  end
end
