json.array!(@bills) do |bill|
  json.extract! bill, :id, :name, :content
  json.url bill_url(bill, format: :json)
end
