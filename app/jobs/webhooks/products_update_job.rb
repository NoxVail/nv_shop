class Webhooks::ProductsUpdateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    p args
  end
end
