# frozen_string_literal: true
class Shop < ActiveRecord::Base
  include ShopifyApp::ShopSessionStorage

  WEBHOOK_TYPES = YAML.load_file('config/webhook_types.yml').freeze
  SUPPORTED_WEBHOOK_TYPES = YAML.load_file('config/supported_webhook_types.yml').freeze

  def api_version
    ShopifyApp.configuration.api_version
  end

  def activate_session
    shopify_session = ShopifyAPI::Session.new(domain: shopify_domain, token: shopify_token, api_version: api_version)
    ShopifyAPI::Base.activate_session(shopify_session)
  end
end
