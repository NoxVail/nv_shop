class NvShopAPI::V1::Funnels < Grape::API
  namespace :funnels do
    desc 'create funnel'
    post :create do
      respond_with Organizers::Funnels::Create
    end

    desc 'delete funnel'
    params do
      requires :id, type: String, allow_blank: false
    end
    delete 'delete/:id' do
      respond_with Organizers::Funnels::Delete
    end
  end
end
