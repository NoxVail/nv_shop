class FunnelsController < AuthenticatedController
  def index
    @funnels = Shop.find_by(shopify_domain: current_shopify_domain).funnels
  end
end
