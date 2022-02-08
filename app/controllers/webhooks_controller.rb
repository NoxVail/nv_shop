# frozen_string_literal: true

class WebhooksController < AuthenticatedController
  def index
    @webhooks = Shop.find_by(shopify_domain: current_shopify_domain).webhooks
  end
end
