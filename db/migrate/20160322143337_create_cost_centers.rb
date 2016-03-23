class CreateCostCenters < ActiveRecord::Migration
  def change
    create_table :cost_centers do |t|
      t.string :name, limit: 100, null: false

      t.timestamps null: false
    end
  end
end
