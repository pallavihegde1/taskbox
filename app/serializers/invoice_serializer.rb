class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :invoice_date, :client_id, :amount
end
