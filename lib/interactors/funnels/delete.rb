class Interactors::Funnels::Delete
  include Interactor
  include Interactor::Contracts

  expects do
    required(:shop).filled
  end

  on_breach do |breaches|
    failed(breaches.map(&:messages).flatten)
  end

  def call
    funnel_delete
  end

  private

  def funnel_delete
    context.fail!(error: 404, message: 'record not found') unless funnel_find
    context.funnel.destroy!
  rescue ActiveRecord::RecordNotDestroyed
    context.fail!(error: 422, message: context.funnel.errors)
  end

  def funnel_find
    context.funnel = context.shop.funnels.find_by(id: context.params[:id])
  end

  def failed(error)
    context.fail!(error: error)
  end
end
