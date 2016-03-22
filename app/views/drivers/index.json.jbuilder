json.array!(@drivers) do |driver|
  json.extract! driver, :id, :vtr, :name, :valor
  json.url driver_url(driver, format: :json)
end
