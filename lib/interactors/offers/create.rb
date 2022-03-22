class Interactors::Offers::Create < Interactors::Base
  expects do
    required(:shop).filled
    required(:funnel).filled
  end

  def call
    offer_create
  end

  private

  def offer_create
    context.offer = context.funnel.offers.new(product_id: context.shop.products.order('RANDOM()').first.id)
    context.fail!(error: 422, message: context.offer.errors) unless context.offer.save
  end
end
