class AccountReceivable < ActiveRecord::Base
  belongs_to :cost_center
  belongs_to :payment_method
  belongs_to :supplier, class_name: "Supplier", foreign_key: "supplier_id", polymorphic: true

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
