class NvShopAPI::Entities::Funnel < Grape::Entity
  expose :name
  expose :data
  expose :active
end
