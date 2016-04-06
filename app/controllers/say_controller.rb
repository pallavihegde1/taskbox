class SayController < ApplicationController  #say is the controller and hello is the action (method)
  def hello

  	@clients = Client.all
  end
    
    def data
    	@clients = Client.all
    	@projects = Project.all
    end
end
