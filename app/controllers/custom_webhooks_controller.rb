# frozen_string_literal: true

class CustomWebhooksController < ApplicationController
  include ShopifyApp::WebhookVerification

  def process_webhook
    job = "#{params[:type].titleize.delete(' ')}Job".constantize
    job.perform_later(params[:type])
  end
end
