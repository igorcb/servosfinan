class AccountReceivable < ActiveRecord::Base
  belongs_to :cost_center
  belongs_to :payment_method
  belongs_to :supplier, class_name: "Supplier", foreign_key: "supplier_id", polymorphic: true
	
  has_many :lower_account_receivables

	before_save :set_supplier_type


  module TipoStatus
    ABERTO = 0
    PAGOPARCIAL = 1
    PAGO = 2
  end

  module TipoAccount
    Fornecedor = 1
    Motorista = 2
    Cliente = 3
    Funcionario = 4
    Transportadora =5
  end

  def status_name
    case self.status
      when 0  then "Aberto"
      when 1  then "P. Parcial"
      when 2  then "Pago"
    else "Nao Definido"
    end
  end 

  def type_account_name
    case self.type_account
      when 1  then "Fornecedor"
      when 2  then "Motorista"
      when 3  then "Cliente"
      when 4  then "Funcionario"
      when 5  then "Transportadora"
      else "*"
    end
  end

  def total_pago
    self.lower_account_receivables.sum(:total_pago)
  end

  def saldo
    self.valor - self.lower_account_receivables.sum(:valor_pago)
  end

  def valor_total_pago
    self.lower_account_receivables.sum(:valor_pago)
  end

  def payament(options)
    #options ||= {}
    ActiveRecord::Base.transaction do
      vr_pago = options[:valor_pago].to_f + options[:juros].to_f - options[:desconto].to_f
      options[:total_pago] = vr_pago

      vr_total_pago = valor_total_pago + options[:valor_pago].to_f

      if vr_total_pago >= self.valor
        self.status = TipoStatus::PAGO
      elsif vr_total_pago < self.valor
        self.status = TipoStatus::PAGOPARCIAL
      end

      self.lower_account_receivables.create!(data_pagamento: options[:data_pagamento],
                                             valor_pago: options[:valor_pago],
                                             juros: options[:juros],
                                             desconto: options[:desconto],
                                             payment_method_id: options[:payment_method_id],
                                             observacao: options[:observacao],
                                             total_pago: options[:total_pago],
                                             cash_account_id: options[:cash_account_id],
                                             cost_center_id: options[:cost_center_id]
                                          )
      self.save

      CurrentAccount.create!(cash_account_id: options[:cash_account_id],
                            cost_center_id: options[:cost_center_id],
                            data: options[:data_pagamento],  
                            valor: vr_pago,
                            tipo: CurrentAccount::TipoLancamento::CREDITO,
                            historico: "BAIXA CONTA A RECEBER: " + self.documento
                            
                            )
    end
  end

  def check_balance
  	self.status = self.lower_account_receivables.sum(:valor_pago).to_f > 0.0 ? 
	                TipoStatus::PAGOPARCIAL : self.status = TipoStatus::ABERTO
	  self.save!
  end

  private 
    def can_destroy?
      if self.account_receive.present? ||
        errors.add(:base, "You can not delete record with relationship") 
        return false
      end
    end

  protected
  
  def set_supplier_type
    case self.type_account
      when 1 then self.supplier_type = "Supplier"
      when 2 then self.supplier_type = "Driver"
      when 3 then self.supplier_type = "Client"
      when 4 then self.supplier_type = "Employee"
      when 5 then self.supplier_type = "Carrier"
      else self.supplier_type = "Supplier"
    end
  end

end
