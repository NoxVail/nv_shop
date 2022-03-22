class Organizers::Webhooks::ProductsCreate < Organizers::Base
  expects do
    required(:shop_domain).filled(:str?)
    required(:params).filled(:hash?)
  end

  organize Interactors::Webhooks::ProductCreate,
           Interactors::Webhooks::VariantCreate
end
