class Interactors::Funnels::TriggerProducts::Delete
  include Interactor
  include Interactor::Contracts

  expects do
    required(:shop).filled
    required(:funnel).filled
  end

  on_breach do |breaches|
    failed(breaches.map(&:messages).flatten)
  end

  def call
    trigger_products_delete
  end

  private

  def trigger_products_delete
    context.funnel.data = {}
    context.fail!(error: 422, message: context.funnel.errors) unless context.funnel.save
  end

  def failed(error)
    context.fail!(error: error)
  end
end
