class Webhooks::ProductsDeleteJob < ApplicationJob
  queue_as :webhooks

  def perform(*args)
    p args
  end
end
