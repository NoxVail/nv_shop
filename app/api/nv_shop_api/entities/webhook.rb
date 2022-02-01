class NvShopAPI::Entities::Webhook < Grape::Entity
  expose :shopify_domain
  expose :webhooks
end
