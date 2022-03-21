class FunnelsController < AuthenticatedController
  before_action :shop, only: %i[index show]

  def index
    @funnels = @shop.funnels
  end

  def show
    @funnel = @shop.funnels.find(funnel_params[:id])
    @trigger_products = Product.where(id: @funnel.data['product_ids'])
    @offers = @funnel.offers
  end

  def funnel_params
    params.permit(:id)
  end

  private

  def shop
    @shop = Shop.find_by(shopify_domain: current_shopify_domain)
  end
end
