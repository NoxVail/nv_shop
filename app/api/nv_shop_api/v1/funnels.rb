class NvShopAPI::V1::Funnels < Grape::API
  namespace :funnels do
    desc 'create funnel'
    post :create do
      respond_with Organizers::Funnels::Create
    end
  end
end
