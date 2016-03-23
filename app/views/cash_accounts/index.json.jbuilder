json.array!(@cash_accounts) do |cash_account|
  json.extract! cash_account, :id, :name, :bank_id, :agencia, :conta_corrente
  json.url cash_account_url(cash_account, format: :json)
end
