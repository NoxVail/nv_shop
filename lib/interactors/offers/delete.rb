class Interactors::Offers::Delete
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
    funnel_delete
  end

  private

  def funnel_delete
    context.fail!(error: 404, message: 'funnel not found') unless funnel_find
    context.fail!(error: 404, message: 'offer not found') unless offer_find

    context.fail!(error: 422, message: context.offer.errors) unless context.offer.destroy
  end

  def funnel_find
    context.funnel = context.shop.funnels.find_by(id: context.params[:funnel_id])
  end

  def offer_find
    context.offer = context.funnel.offers.find_by(id: context.params[:offer_id])
  end

  def failed
    context.fail!(error: error)
  end
end
