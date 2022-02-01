class NvShopAPI::V1::Webhooks < Grape::API
  namespace :webhooks do
    desc 'create webhook'
    params do
      requires :topic, type: String
    end
    post :create do
      respond_with Organizers::Webhooks::Create
    end

    desc 'delete webhook'
    params do
      requires :topic, type: String
    end
    delete :delete do
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