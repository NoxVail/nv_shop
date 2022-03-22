class Interactors::Shared::FunnelFind < Interactors::Base
  expects do
    required(:shop).filled
    required(:params).schema do
      required(:funnel_id).filled
    end
  end

  def call
    context.fail!(error: 404, message: 'funnel not found') unless funnel_find
  end

  private

  def funnel_find
    context.funnel = context.shop.funnels.find_by(id: context.params[:funnel_id])
  end
end
