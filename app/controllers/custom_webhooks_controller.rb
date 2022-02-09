# frozen_string_literal: true

class CustomWebhooksController < ApplicationController
  include ShopifyApp::WebhookVerification

  def process_webhook
    return unless params[:type].in?(Shop.supported_types_underscored)

    job = "#{params[:type].classify}Job".constantize
    job.perform_later(params[:type])
  end
end
