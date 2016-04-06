class TasksController < ApplicationController
before_filter :authenticate_user!

	def create 
      @task = Task.new(task_params)
      if @task.save
      	redirect_to project_path(@task.project_id), notice: "Successfully created"
      	else
      		render "/projects/#{@task.project_id}"
      	end
      end
def mark_as_complete
	@task =Task.find(params[:task_id])
	@task.update_attributes(is_completed: true)
      Notification.mark_as_complete(@task).deliver!
	redirect_to :back, notice: "Marked as complete"
end
def mark_as_incomplete
@task =Task.find(params[:task_id])
	@task.update_attributes(is_completed: false)
      Notification.mark_as_incomplete(@task).deliver!
	redirect_to :back, notice: "Marked as incomplete"
end
private
def task_params
params[:task].permit(:name,:project_id,:is_completed,:due_date)
end
end