class LowerAccountReceivable < ActiveRecord::Base
  belongs_to :account_receivable
  belongs_to :cash_account

  before_destroy :rollback_current_account

  def rollback_current_account
  	options ||= {}
  	ActiveRecord::Base.transaction do
      options[:cash_account_id] = self.cash_account_id
      options[:cost_center_id] = self.cost_center_id
      options[:data_pagamento] = data = Time.now.strftime('%Y-%m-%d')
      options[:vr_pago] = self.valor_pago

      CurrentAccount.create!(cash_account_id: options[:cash_account_id],
                            cost_center_id: options[:cost_center_id],
                            data: options[:data_pagamento],  
                            valor: options[:vr_pago],  
                            tipo: CurrentAccount::TipoLancamento::DEBITO,
                            historico: "ESTORNO CONTA A RECEBER: " + self.account_receivable.documento
                            
                            )  		
  	end
  end
end
