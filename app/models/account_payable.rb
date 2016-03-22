class AccountPayable < ActiveRecord::Base
  belongs_to :payment_method
end
