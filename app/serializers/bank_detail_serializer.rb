class BankDetailSerializer < ActiveModel::Serializer
  attributes :id, :client_id, :acc_no, :bank_name, :tin_number
end
