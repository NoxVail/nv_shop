class Organizers::Funnels::TriggerProducts::Delete
  include Interactor::Organizer

  organize Interactors::Shared::FunnelFind,
           Interactors::Funnels::TriggerProducts::Delete
end
