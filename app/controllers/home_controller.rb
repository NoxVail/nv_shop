# frozen_string_literal: true

class HomeController < AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
  end

  def webhooks
    @webhooks = Shop.find_by(shopify_domain: current_shopify_domain).webhooks
  end
end
