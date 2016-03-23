class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :vtr, limit: 5, null: false
      t.string :name, limit: 100, null: false
      t.decimal :valor, precision: 10, scale: 2, null: true

      t.timestamps null: false
    end
  end
end
