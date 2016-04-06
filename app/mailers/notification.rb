class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.mark_as_complete.subject
  #
  def mark_as_complete(task)
    @task=task

    mail to: "#{@task.project.client.email}",subject: "Task completed -#{@task.name}"
  end

  def mark_as_incomplete(task)
  	@task=task

    mail to: "#{@task.project.client.email}",subject: "Task completed -#{@task.name}"
end
end
