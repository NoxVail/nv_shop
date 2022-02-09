# frozen_string_literal: true

class CustomWebhooksController < ApplicationController
  include ShopifyApp::WebhookVerification

  # ProductsCreateJob
  # ProductsDeleteJob
  def process_webhook
    return unless params[:type].in?(Shop::SUPPORTED_TYPES_UNDERSCORED)

    job = "#{params[:type].classify}Job".constantize
    job.perform_later(params[:type])
  end
end
