class Organizers::Offers::Delete < Organizers::Base
  expects do
    required(:shop).filled
    required(:params).schema do
      required(:funnel_id).filled
    end
  end

  organize Interactors::Shared::FunnelFind,
           Interactors::Offers::Delete
end
