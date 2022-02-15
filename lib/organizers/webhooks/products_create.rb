class Organizers::Webhooks::ProductsCreate
  include Interactor::Organizer

  organize Interactors::Webhooks::ProductCreate
end
