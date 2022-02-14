class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.bigint :shopify_id
      t.string :src
      t.timestamps

      t.references :owner, polymorphic: true
    end
  end
end
