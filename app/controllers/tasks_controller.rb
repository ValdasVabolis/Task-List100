class TasksController < ApplicationController
  before_action :set_task, only: %w[create]

  def create
  end

  private

  def set_task
    @task = Task.new(task_params)
  end

  def task_params
    params.require(:task).permit(:description)
  end
end
