class Organizers::Webhooks::Create < Organizers::Base
  expects do
    required(:shop).filled
    required(:params).schema do
      required(:topic).filled
    end
  end

  organize Interactors::Webhooks::Create
end
