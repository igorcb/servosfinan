json.array!(@account_receivables) do |account_receivable|
  json.extract! account_receivable, :id, :type_account, :supplier_id, :cost_center_id, :payment_method_id, :documento, :data_vencimento, :valor, :observacao
  json.url account_receivable_url(account_receivable, format: :json)
end
