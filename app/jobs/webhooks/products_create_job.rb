class Webhooks::ProductsCreateJob < ApplicationJob
  queue_as :webhooks

  def perform(...)
    interactor = Organizers::Webhooks::ProductsCreate.(...)
    raise interactor.error if interactor.failure?
  end
end
