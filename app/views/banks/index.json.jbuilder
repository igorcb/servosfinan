json.array!(@banks) do |bank|
  json.extract! bank, :id, :number, :name
  json.url bank_url(bank, format: :json)
end
