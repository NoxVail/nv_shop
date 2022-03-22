class Interactors::Webhooks::VariantCreate < Interactors::Base
  expects do
    required(:params).filled(:hash?)
    required(:product).filled
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
      FIELD_MAP.each { |k, v| variant_data[k] = variant_hash[v] }
      variant = context.product.variants.create_with(variant_data).find_or_initialize_by(shopify_id: variant_data[:shopify_id])
      failed(variant.errors.full_messages) unless variant.save
    end
  end
end
