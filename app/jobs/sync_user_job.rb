class SyncUserJob < ApplicationJob
  queue_as :default

  def perform(email, password)
    GlobalPost::HTTP.sync_user(email, password)
  end
end
