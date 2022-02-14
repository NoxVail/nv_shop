# frozen_string_literal: true

class CustomWebhooksController < ApplicationController
  include ShopifyApp::WebhookVerification

  # ProductsCreateJob
  # ProductsDeleteJob
  def process_webhook
    return unless params[:type].in?(Shop::SUPPORTED_TYPES_UNDERSCORED)

    job = "Webhooks::#{params[:type].classify}Job".constantize
    job.perform_later(job_params) if params[:type].eql?('products_create')
  end

  def webhook_params
    params.require(:custom_webhook).permit(:id, :title, :body_html, :vendor, :product_type, :handle, :published_at, :template_suffix, :status,
                                           :published_scope, :tags, :admin_graphql_api_id, :variants,
                                           options: [:id, :product_id, :name, :position, values: []],
                                           variants: %i[id title price sku weight weight_unit]) # , :variants :images, :image
  end

  private

  def job_params
    {
      shop_domain: request.headers['HTTP_X_SHOPIFY_SHOP_DOMAIN'],
      webhook_params: webhook_params.to_h
    }
  end
end
