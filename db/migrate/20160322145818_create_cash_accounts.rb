class CreateCashAccounts < ActiveRecord::Migration
  def change
    create_table :cash_accounts do |t|
      t.string :name
      t.references :bank, index: true, foreign_key: true
      t.string :agencia
      t.string :conta_corrente

      t.timestamps null: false
    end
  end
end
