 class ProjectsController < ApplicationController
     before_filter :authenticate_user!
    
   
        def index
        	if params[:client_id]
            @projects =current_user.projects.where('client_id=?',params[:client_id])
          else
            @projects =current_user.projects
          end

        end

        def new 
             @project=Project.new

        end

        def create
        	@project = Project.new(project_params)
	if @project.save
		redirect_to projects_path, notice: "suceessfully created the project"
	else
	   render "new"
	end

        end

        def show 
        @project = Project.find(params[:id])
        @task=Task.new
        end

        def edit 
    begin
      @project = Project.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to projects_path, notice: "Record Not Found"
     end
    end
    def update 
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
        redirect_to project_path(@project.id), notice:"suceessfully updated the project"
    else 
        render "edit"

    end
    end
    def destroy
       @project = Project.find(params[:id])
       @project.destroy
       redirect_to projects_path, notice:"suceessfully deleted the project"
    end
            private
    def project_params
    	params[:project].permit(:client_id,:name,:description,:start_date,:status)

    end 
    end
