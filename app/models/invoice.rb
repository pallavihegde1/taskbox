class Invoice < ActiveRecord::Base
	belongs_to :client

	def details 
		"#{invoice_date}"
	end
end
