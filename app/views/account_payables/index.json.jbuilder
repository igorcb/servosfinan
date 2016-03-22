json.array!(@account_payables) do |account_payable|
  json.extract! account_payable, :id, :type_account, :supplier_id, :cost_center_id, :payment_method_id, :documento, :data_vencimento, :valor, :observacao
  json.url account_payable_url(account_payable, format: :json)
end
