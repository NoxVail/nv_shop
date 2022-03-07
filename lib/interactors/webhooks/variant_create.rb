class Interactors::Webhooks::VariantCreate
  include Interactor
  include Interactor::Contracts

  expects do
    required(:params).filled(:hash?)
    required(:product).filled
  end

  on_breach do |breaches|
    failed(breaches.map(&:messages).flatten)
  end

  DIRECT_FIELDS = %i[title price sku weight weight_unit].freeze

  FIELD_MAP = { shopify_id: :id }.freeze

  def call
    create_variant
  end

  private

  def create_variant
    context.params[:variants].each do |variant_hash|
      variant_data = variant_hash.slice(*DIRECT_FIELDS)
      FIELD_MAP.each { |k, v| variant_data[k] = context.params[v] }
      variant = context.product.variants.create_with(variant_data).find_or_initialize_by(shopify_id: variant_data[:shopify_id], title: variant_data[:title])
      failed(variant.errors.full_messages) unless variant.save
    end
  end

  def failed(error)
    context.fail!(error: error.join(', '))
  end
end
