# frozen_string_literal: true

class WebhooksController < AuthenticatedController
  include ShopifyApp::EmbeddedApp
  include ShopifyApp::RequireKnownShop
  include ShopifyApp::ShopAccessScopesVerification

  def index
    @webhooks = Shop.find_by(shopify_domain: @shop.domain).webhooks
  end
end
