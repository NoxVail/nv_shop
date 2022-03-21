class NvShopAPI::V1::Offers < Grape::API
  namespace :offers do
    desc 'create offer'
    params do
      requires :funnel_id, type: String, allow_blank: false
    end
    post :create do
      respond_with Organizers::Offers::Create
    end

    desc 'delete offer'
    params do
      requires :funnel_id, type: String, allow_blank: false
      requires :offer_id, type: String, allow_blank: false
    end
    delete :delete do
      respond_with Organizers::Offers::Delete
    end
  end
end
