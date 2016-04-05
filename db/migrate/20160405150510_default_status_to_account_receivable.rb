class DefaultStatusToAccountReceivable < ActiveRecord::Migration
  def change
  	change_column_default :account_receivables, :status, 0
  end
end


#change_column_null :products, :name, false
#change_column_default :products, :approved, false
