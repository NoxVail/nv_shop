class Interactors::Funnels::TriggerProducts::Delete < Interactors::Base
  expects do
    required(:shop).filled
    required(:funnel).filled
  end

  def call
    trigger_products_delete
  end

  private

  def trigger_products_delete
    context.funnel.data = {}
    context.fail!(error: 422, message: context.funnel.errors) unless context.funnel.save
  end
end
