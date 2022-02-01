class NvShopAPI::V1::Webhooks < Grape::API
  namespace :webhooks do
    desc 'create webhook'
    params do
      requires :topic, type: String
    end
    post :create do
      respond_with Organizers::Webhooks::Create,
                   NvShopAPI::Entities::Webhook
    end

    desc 'delete webhook'
    params do
      requires :topic, type: String
    end
    delete :delete do
      respond_with Organizers::Webhooks::Delete,
                   NvShopAPI::Entities::Webhook
    end
  end
end
