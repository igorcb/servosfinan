class Driver < ActiveRecord::Base
  has_many :account_receivable, class_name: "AccountReceivable", foreign_key: "supplier_id"
  scope :ordered, -> { order("name asc") }
end
