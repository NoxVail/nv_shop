class Interactors::Webhooks::ProductCreate < Interactors::Base
  expects do
    required(:shop_domain).filled(:str?)
    required(:params).filled(:hash?)
  end

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
    product_data = context.params.slice(*DIRECT_FIELDS)
    FIELD_MAP.each { |k, v| product_data[k] = context.params[v] }
    context.product.attributes = product_data
    failed(context.product.errors.full_messages) unless context.product.save
  end
end
