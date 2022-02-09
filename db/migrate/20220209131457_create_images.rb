class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.integer :shopify_id
      t.references :imageable, polymorphic: true
      t.timestamps
    end
  end
end
