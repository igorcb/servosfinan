class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :vtr
      t.string :name
      t.decimal :valor

      t.timestamps null: false
    end
  end
end
