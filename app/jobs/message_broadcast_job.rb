class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(messge)
    # Do something later
    ActionCable.server.broadcast "chat", {
      messge: render_message(messge)
    }
  end

  private
  def render_message(messge)
    MessgesController.render(
      partial: 'messge',
      locals: {
        messge: messge
      }
    )
  end
end
