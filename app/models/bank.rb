class Bank < ActiveRecord::Base
	has_many :cash_accounts

  def name_full
  	self.number + ' - ' + self.name
  end	
end
