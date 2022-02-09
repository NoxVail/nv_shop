class CreateVariants < ActiveRecord::Migration[6.1]
  def change
    create_table :variants do |t|
      t.integer :shopify_id
      t.string :title
      t.string :price
      t.string :sku
      t.float :weight
      t.string :weight_unit
      t.timestamps

      t.references :product, index: true
    end
  end
end
