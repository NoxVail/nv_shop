class Organizers::Funnels::TriggerProducts::Delete < Organizers::Base
  expects do
    required(:shop).filled
    required(:params).schema do
      required(:funnel_id).filled
    end
  end

  organize Interactors::Shared::FunnelFind,
           Interactors::Funnels::TriggerProducts::Delete
end
