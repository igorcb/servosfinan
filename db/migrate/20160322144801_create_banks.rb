class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :number,limit: 5, null: false
      t.string :name, limit: 60, null: false

      t.timestamps null: false
    end
  end
end
