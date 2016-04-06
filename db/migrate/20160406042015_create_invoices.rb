class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.date :invoice_date
      t.integer :client_id
      t.integer :amount

      t.timestamps null: false
    end
  end
end
