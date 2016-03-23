json.array!(@current_accounts) do |current_account|
  json.extract! current_account, :id, :cash_account_id, :cost_center_id, :tipo, :data, :valor, :historico
  json.url current_account_url(current_account, format: :json)
end
