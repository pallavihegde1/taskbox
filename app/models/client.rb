class Client < ActiveRecord::Base
	acts_as_paranoid

	has_many:projects, dependent: :destroy
	belongs_to:user
	has_one :bank_detail
	has_many :invoices
	accepts_nested_attributes_for :bank_detail #depend on association
	

validates_presence_of :name,:email
validates_length_of :name,minimum:3,maximum:20
validates_numericality_of :mobile
validates_length_of :mobile, is:10
validates_uniqueness_of :email
validates_format_of:email,with:/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

def list_projects
		Project.where('client_id =?', self.id)
end
def open_projects
	Project.where('client_id = ? AND status = ?',self.id,"open")    #its called on client object which is retrieved

end
def completed_projects
	Project.where('client_id = ? AND status = ?',self.id,"completed")
end


end
