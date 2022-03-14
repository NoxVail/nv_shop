class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.timestamps

      t.references :funnel, index: true
      t.references :product, index: true
    end
  end
end
