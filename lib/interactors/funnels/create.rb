class Interactors::Funnels::Create < Interactors::Base
  expects do
    required(:shop).filled
  end

  def call
    context.fail!(error: 422, message: context.funnel.errors) unless funnel_create
    context.response = context.funnel
  end

  private

  def funnel_create
    context.funnel = context.shop.funnels.new(name: Faker::ElectricalComponents.active)
    context.funnel.save
  end
end
