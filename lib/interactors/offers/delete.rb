class Interactors::Offers::Delete < Interactors::Base
  expects do
    required(:shop).filled
    required(:funnel).filled
  end

  def call
    funnel_delete
  end

  private

  def funnel_delete
    context.fail!(error: 404, message: 'offer not found') unless offer_find

    context.fail!(error: 422, message: context.offer.errors) unless context.offer.destroy
  end

  def offer_find
    context.offer = context.funnel.offers.find_by(id: context.params[:offer_id])
    # context.offer = context.shop.offers.find_by(id: context.params[:offer_id], funnel_id: context.params[:funnel_id])
  end
end
