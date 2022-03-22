class Organizers::Offers::Delete
  include Interactor::Organizer

  organize Interactors::Shared::FunnelFind,
           Interactors::Offers::Delete
end
