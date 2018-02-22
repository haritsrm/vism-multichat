class BroadcastMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'room_channel', render_message(message)
    # Do something later
  end

  private
  def render_message(message)
    ApplicationController.renderer.render message
  end
end
