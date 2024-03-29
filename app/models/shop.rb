# frozen_string_literal: true

class Shop < ActiveRecord::Base
  include ShopifyApp::ShopSessionStorage

  WEBHOOK_TYPES = YAML.load_file('config/webhook_types.yml').freeze
  SUPPORTED_WEBHOOK_TYPES = YAML.load_file('config/supported_webhook_types.yml').freeze
  SUPPORTED_TYPES_UNDERSCORED = SUPPORTED_WEBHOOK_TYPES.map { |type| type.gsub('/', '_') }.freeze

  has_many :products, dependent: :destroy
  has_many :funnels, dependent: :destroy
  has_many :offers, through: :funnels

  def api_version
    ShopifyApp.configuration.api_version
  end

  def activate_session
    shopify_session = ShopifyAPI::Session.new(domain: shopify_domain, token: shopify_token, api_version: api_version)
    ShopifyAPI::Base.activate_session(shopify_session)
  end
end
