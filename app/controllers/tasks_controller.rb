class TasksController < ApplicationController
  before_action :set_task, only: [:complete, :destroy]
  before_action :set_list, only: [:create, :complete, :destroy]

	def create
		respond_to do |format|
			@task = @list.tasks.create(task_params)
			if @task.save
				ListChannel.broadcast(@task)
				format.html { redirect_to @list, notice: 'Task added' }
			else
				format.html { redirect_to @list, notice: 'Enter task name' }
			end
		end
	end

	def complete
		@task.update_attribute(:is_done, true)
		ListChannel.broadcast(@task)
		redirect_to @list
	end

	def destroy
    @task.destroy
		ListChannel.broadcast(@task)
    respond_to do |format|
      format.html { redirect_to @list, notice: 'Task deleted' }
    end
	end

	private
		def set_task
      @task = Task.find(params[:id])
    end

    def set_list
      @list = List.find(params[:list_id])
    end

		def task_params
			params.require(:task).permit(:title, :is_done, :list_id)
		end
end
