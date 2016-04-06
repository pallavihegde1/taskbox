json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :invoice_date, :client_id, :amount
  json.url invoice_url(invoice, format: :json)
end
