class Webhooks::ProductsCreateJob < ApplicationJob
  queue_as :default

  def perform(...)
    Organizers::Webhooks::ProductsCreate.(...)
  end
end
