class CreateFunnels < ActiveRecord::Migration[6.1]
  def change
    create_table :funnels do |t|
      t.string :name
      t.jsonb :data, default: {}
      t.boolean :active, default: false
      t.timestamps

      t.references :shop, index: true
    end
  end
end
