class Webhooks::ProductsCreateJob < ApplicationJob
  queue_as :default

  def perform(shop_domain:, webhook_params:)
    Organizers::Webhooks::ProductsCreate.(
      shop_domain: shop_domain,
      params: webhook_params
    )
  end
end
