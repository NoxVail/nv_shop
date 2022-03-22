class Organizers::Offers::Create
  include Interactor::Organizer

  organize Interactors::Shared::FunnelFind,
           Interactors::Offers::Create
end
