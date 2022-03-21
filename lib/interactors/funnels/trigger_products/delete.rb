class Interactors::Funnels::TriggerProducts::Delete
  include Interactor
  include Interactor::Contracts

  expects do
    required(:shop).filled
    required(:params).schema do
      required(:funnel_id).filled
    end
  end

  on_breach do |breaches|
    failed(breaches.map(&:messages).flatten)
  end

  def call
    trigger_products_delete
  end

  private

  def trigger_products_delete
    context.fail!(error: 404, message: 'record not found') unless funnel_find

    context.funnel.data = {}
    context.fail!(error: 422, message: context.funnel.errors) unless context.funnel.save
  end

  def funnel_find
    context.funnel = context.shop.funnels.find_by(id: context.params[:funnel_id])
  end

  def failed(error)
    context.fail!(error: error)
  end
end
