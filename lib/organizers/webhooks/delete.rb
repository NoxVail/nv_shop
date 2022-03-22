class Organizers::Webhooks::Delete < Organizers::Base
  expects do
    required(:shop).filled
    required(:params).schema do
      required(:topic).filled
    end
  end

  organize Interactors::Webhooks::Delete
end
