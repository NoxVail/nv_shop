class Interactors::Webhooks::ProductsCreate
  include Interactor
  include Interactor::Contracts

  DIRECT_FIELDS = %i[title vendor product_type handle published_at template_suffix status published_scope tags admin_graphql_api_id].freeze

  FIELD_MAP = {
    shopify_id: :id,
    description: :body_html
  }.freeze

  def call
    context.shop = Shop.find_by(shopify_domain: context.shop_domain)
    context.product = context.shop.products.new
    create_product
  end

  private

  def create_product
    context.params.slice(*DIRECT_FIELDS).keys.map(&:to_sym).each { |k| mapper(k, k) }
    FIELD_MAP.each { |k, v| mapper(k, v) }
    context.product.shop = context.shop
    context.product.save
  end

  def mapper(key, value)
    context.product.send("#{key}=", context.params[value])
  end
end
