# frozen_string_literal: true

class Shop < ActiveRecord::Base
  include ShopifyApp::ShopSessionStorageWithScopes

  WEBHOOK_TYPES = %w[
    app/uninstalled bulk_operations/finish carts/create carts/update checkouts/create checkouts/delete checkouts/update
    collection_listings/add collection_listings/remove collection_listings/update collections/create collections/delete
    collections/update customer_groups/create customer_groups/delete customer_groups/update customer_payment_methods/create
    customer_payment_methods/revoke customer_payment_methods/update customers/create customers/delete customers/disable
    customers/enable customers/update customers_marketing_consent/update disputes/create disputes/update domains/create
    domains/destroy domains/update draft_orders/create draft_orders/delete draft_orders/update fulfillment_events/create
    fulfillment_events/delete fulfillments/create fulfillments/update inventory_items/create inventory_items/delete
    inventory_items/update inventory_levels/connect inventory_levels/disconnect inventory_levels/update locales/create locales/update
    locations/create locations/delete locations/update order_transactions/create orders/cancelled orders/create orders/delete
    orders/edited orders/fulfilled orders/paid orders/partially_fulfilled orders/updated product_listings/add product_listings/remove
    product_listings/update products/create products/delete products/update profiles/create profiles/delete profiles/update
    refunds/create scheduled_product_listings/add scheduled_product_listings/remove scheduled_product_listings/update
    selling_plan_groups/create selling_plan_groups/delete selling_plan_groups/update shop/update themes/update
    subscription_billing_attempts/challenged subscription_billing_attempts/failure subscription_billing_attempts/success
    subscription_contracts/create subscription_contracts/update tender_transactions/create themes/create themes/delete themes/publish
  ].freeze

  def api_version
    ShopifyApp.configuration.api_version
  end

  def activate_session
    shopify_session = ShopifyAPI::Session.new(domain: shopify_domain, token: shopify_token, api_version: api_version)
    ShopifyAPI::Base.activate_session(shopify_session)
  end
end
