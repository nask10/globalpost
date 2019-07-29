class MarkNotificationAsReadJob < ApplicationJob
  queue_as :default

  def perform(code)
    GlobalPost::Notification::HTTP.mark_as_read(code)
  end
end
