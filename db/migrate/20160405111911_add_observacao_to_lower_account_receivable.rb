class AddObservacaoToLowerAccountReceivable < ActiveRecord::Migration
  def change
    add_column :lower_account_receivables, :observacao, :text
  end
end
