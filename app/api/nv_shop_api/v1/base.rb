module NvShopAPI
  module V1
    class Base < Grape::API
      version :v1, using: :path
      prefix 'nv_shop/api'

      default_format :json
      format :json

      desc 'create webhook'
      params do
        requires :topic, type: String
      end
      post :create do
        shop = Shop.find_by(shopify_domain: headers['Shopify-Domain'])
        shop.activate_session
        ShopifyAPI::Webhook.create(address: ENV.fetch('WEBHOOK_URL'), topic: params[:topic])
        shop.webhooks << params[:topic]
        shop.save
      ensure
        ShopifyAPI::Base.clear_session
      end

      desc 'delete webhook'
      params do
        requires :topic, type: String
      end
      delete :delete do
        shop = Shop.find_by(shopify_domain: headers['Shopify-Domain'])
        shop.activate_session
        webhook = ShopifyAPI::Webhook.all.detect { |wk| wk.topic.eql?(params[:topic]) }
        error!('couldn\'t find webhook subscription', 404) unless webhook
        webhook.destroy
        shop.webhooks.delete(params[:topic])
        shop.save
      ensure
        ShopifyAPI::Base.clear_session
      end
    end
  end
end
