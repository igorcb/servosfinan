class AddPaymentMethodToLowerAccountReceivable < ActiveRecord::Migration
  def change
    add_column :lower_account_receivables, :payment_method_id, :integer
  end
end
