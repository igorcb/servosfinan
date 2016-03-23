class CreateCurrentAccounts < ActiveRecord::Migration
  def change
    create_table :current_accounts do |t|
      t.references :cash_account, index: true, foreign_key: true
      t.references :cost_center, index: true, foreign_key: true
      t.integer :tipo, null: false
      t.date :data, index: true, null: false
      t.decimal :valor, :precision => 10, :scale => 2, null: false, default: 0
      t.string :historico, limit: 250, null: false

      t.timestamps null: false
    end
  end
end
