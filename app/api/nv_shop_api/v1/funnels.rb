class NvShopAPI::V1::Funnels < Grape::API
  namespace :funnels do
    desc 'create funnel'
    post :create do
      respond_with Organizers::Funnels::Create
    end

    desc 'delete funnel'
    params do
      requires :funnel_id, type: String, allow_blank: false
    end
    delete 'delete/:funnel_id' do
      respond_with Organizers::Funnels::Delete
    end

    desc 'add trigger products'
    params do
      requires :funnel_id, type: String, allow_blank: false
    end
    post :trigger_products do
      respond_with Organizers::Funnels::TriggerProducts::Create
    end

    desc 'delete trigger products'
    params do
      requires :funnel_id, type: String, allow_blank: false
    end
    delete :trigger_products do
      respond_with Organizers::Funnels::TriggerProducts::Delete
    end
  end
end
