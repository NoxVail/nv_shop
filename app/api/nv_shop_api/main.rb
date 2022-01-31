class NvShopAPI::Main < Grape::API
  mount NvShopAPI::V1::Base
end
