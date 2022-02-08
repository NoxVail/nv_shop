# frozen_string_literal: true

class CustomWebhooksController < ApplicationController
  include ShopifyApp::WebhookVerification

  def process_webhook
    p 'webhook'
  end
end
