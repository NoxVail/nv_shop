class Organizers::Offers::Create < Organizers::Base
  expects do
    required(:shop).filled
    required(:params).schema do
      required(:funnel_id).filled
    end
  end

  organize Interactors::Shared::FunnelFind,
           Interactors::Offers::Create
end
