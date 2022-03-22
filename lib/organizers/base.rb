class Organizers::Base
  include Interactor::Organizer
  include Interactor::Contracts

  on_breach do |breaches|
    failed(breaches.map(&:messages).flatten)
  end

  def failed(error)
    context.fail!(error: error)
  end
end
