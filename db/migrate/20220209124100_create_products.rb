class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.bigint :shopify_id
      t.string :title
      t.string :description
      t.string :vendor
      t.string :product_type
      t.string :handle
      t.string :published_at
      t.string :template_suffix
      t.string :status
      t.string :published_scope
      t.string :tags
      t.string :admin_graphql_api_id
      t.timestamps

      t.references :shop, index: true
      t.references :variant, index: true
    end
  end
end
