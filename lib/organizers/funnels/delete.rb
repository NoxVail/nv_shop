class Organizers::Funnels::Delete
  include Interactor::Organizer

  organize Interactors::Shared::FunnelFind,
           Interactors::Funnels::Delete
end
