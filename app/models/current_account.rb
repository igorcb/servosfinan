class CurrentAccount < ActiveRecord::Base
  validates :cash_account_id, presence: true
  validates :data, presence: true
  validates :valor, presence: true
  validates :tipo, presence: true
  validates :historico, presence: true

  belongs_to :cash_account
  belongs_to :cost_center
  #has_many :account_receivables

  module TipoLancamento
    CREDITO = 1
    DEBITO  = -1
  end
  
  def credito_debito
  	case self.tipo
  		when -1 then "Débito"
  		when  1	then "Crédito"
  		else ""
  	end
  end
end
