class Organizers::Webhooks::ProductsCreate
  include Interactor::Organizer

  organize Interactors::Webhooks::ProductCreate,
           Interactors::Webhooks::VariantCreate
end
