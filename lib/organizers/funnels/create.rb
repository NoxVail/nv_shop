class Organizers::Funnels::Create < Organizers::Base
  expects do
    required(:shop).filled
  end

  organize Interactors::Funnels::Create
end
