class CreateAccountReceivables < ActiveRecord::Migration
  def change
    create_table :account_receivables do |t|
      t.integer :type_account, index: true
      t.integer :supplier_id, index: true
      t.integer :cost_center_id, index: true
      t.references :payment_method, index: true, foreign_key: true
      t.string :documento, limit: 20, index: true, null: false
      t.date :data_vencimento, index: true, null: false
      t.decimal :valor, :precision => 10, :scale => 2, null: false, default: 0
      t.text :observacao
      t.integer :status
      t.string :supplier_type

      t.timestamps null: false
    end
  end
end
