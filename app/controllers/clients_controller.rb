class ClientsController < ApplicationController
before_filter :authenticate_user!

def index
         @clients = current_user.is_admin ? Client.all : current_user.clients
end

def new 
        @client= Client.new
        @bank_detail = @client.build_bank_detail
end

def create 
	@client = Client.new(client_params)
	@client.user_id = current_user.id
	if @client.save
		redirect_to clients_path, notice: "suceessfully created the client"
	else
	   render "new"
	end
end

def show

	begin
     @client = current_user.clients.find(params[:id])
 rescue ActiveRecord::RecordNotFound
 	redirect_to clients_path, notice: "Record Not Found"
 	end
 	#respond_to do |format|
    #format.html
    #format.json { render json: @client,root: false} 
#end
 
end

def edit 
	begin
  @client = Client.find(params[:id])
  rescue ActiveRecord::RecordNotFound
 	redirect_to clients_path, notice: "Record Not Found"
 end
     @bank_detail =@client.bank_detail.nil? ? @client.build_bank_detail : @client_bank_detail
end

def update 
@client = Client.find(params[:id])
if @client.update_attributes(client_params)
	redirect_to client_path(@client.id), notice:"suceessfully updated the client"
else 
	render "edit"

end
end
def destroy
   @client = Client.find(params[:id])
   @client.destroy
   redirect_to clients_path, notice:"suceessfully deleted the client"
end

private
def client_params
	params[:client].permit(:name, :company, :website, :email, :mobile,bank_detail_attributes: [:acc_no, :bank_name, :tin_number])
end
end