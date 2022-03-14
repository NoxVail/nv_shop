class CreateSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :settings do |t|
      t.binary :image
      t.timestamps

      t.references :offer, index: true
    end
  end
end
