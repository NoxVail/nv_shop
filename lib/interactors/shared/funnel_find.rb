class Interactors::Shared::FunnelFind
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
    context.fail!(error: 404, message: 'funnel not found') unless funnel_find
  end

  private

  def funnel_find
    context.funnel = context.shop.funnels.find_by(id: context.params[:funnel_id])
  end

  def failed(error)
    context.fail!(error: error)
  end
end
