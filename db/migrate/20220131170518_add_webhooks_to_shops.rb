class AddWebhooksToShops < ActiveRecord::Migration[6.1]
  def change
    add_column :shops, :webhooks, :string, array: true, default: []
  end
end
