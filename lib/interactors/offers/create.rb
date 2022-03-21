class Interactors::Offers::Create
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
    offer_create
  end

  private

  def offer_create
    context.fail!(error: 404, message: 'record not found') unless funnel_find

    context.offer = context.funnel.offers.new(product_id: Product.order('RANDOM()').first.id)
    context.fail!(error: 422, message: context.offer.errors) unless context.offer.save
  end

  def funnel_find
    context.funnel = context.shop.funnels.find_by(id: context.params[:funnel_id])
  end

  def failed
    context.fail!(error: error)
  end
end
