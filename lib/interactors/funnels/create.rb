class Interactors::Funnels::Create
  include Interactor
  include Interactor::Contracts

  expects do
    required(:shop).filled
  end

  on_breach do |breaches|
    failed(breaches.map(&:messages).flatten)
  end

  def call
    context.fail!(error: 422, message: context.funnel.errors) unless funnel_create
  end

  private

  def funnel_create
    context.funnel = context.shop.funnels.new(name: Faker::ElectricalComponents.active)
    context.funnel.save
  end

  def failed(error)
    context.fail!(error: error)
  end
end
