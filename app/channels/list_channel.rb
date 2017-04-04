class ListChannel < ApplicationCable::Channel
	def self.broadcast(task)
		broadcast_to task.list, task: 
			TasksController.render(partial: 'tasks/task', locals: { task: task })
	end

  def subscribed
    stream_from "list_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
