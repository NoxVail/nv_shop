class Interactors::Funnels::TriggerProducts::Create
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
    context.fail!(error: 422, message: context.funnel.errors) unless trigger_products_create
  end

  private

  def trigger_products_create
    context.funnel.assign_attributes(data: { product_ids: context.shop.products.order('RANDOM()').limit(2).pluck(:id) })
    context.funnel.save
  end

  def failed(error)
    context.fail!(error: error)
  end
end
