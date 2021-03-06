class CreateLowerAccountReceivables < ActiveRecord::Migration
  def change
    create_table :lower_account_receivables do |t|
      t.references :account_receivable, index: true
      t.references :cash_account, index: true
      t.references :cost_center, index: true
      t.date :data_pagamento, index: true, null: false
      t.decimal :valor_pago, :precision => 10, :scale => 2, null: false, default: 0
      t.decimal :juros, :precision => 10, :scale => 2, null: false, default: 0
      t.decimal :desconto, :precision => 10, :scale => 2, null: false, default: 0
      t.decimal :total_pago, :precision => 10, :scale => 2, null: false, default: 0

      t.timestamps null: false
    end
  end
end
