class CashAccount < ActiveRecord::Base
  belongs_to :bank

  def saldo
  	CurrentAccount.where(cash_account_id: self.id).sum('valor*tipo')
  end
end
