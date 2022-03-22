class Organizers::Funnels::TriggerProducts::Create
  include Interactor::Organizer

  organize Interactors::Shared::FunnelFind,
           Interactors::Funnels::TriggerProducts::Create
end
