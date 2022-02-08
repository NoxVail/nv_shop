# frozen_string_literal: true

class CustomWebhooksController < ApplicationController
  include ShopifyApp::WebhookVerification

  def process_webhook
    return unless params[:type].in?(Shop::SUPPORTED_WEBHOOK_TYPES)

    job = "#{params[:type].titleize.delete(' ')}Job".constantize
    job.perform_later(params[:type])
  end
end
