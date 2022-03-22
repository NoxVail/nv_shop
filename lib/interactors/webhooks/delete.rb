class Interactors::Webhooks::Delete < Interactors::Base
  expects do
    required(:shop).filled
    required(:params).schema do
      required(:topic).filled
    end
  end

  def call
    context.fail!(error: 422, message: context.shop.errors) unless webhook_delete
    context.response = context.shop
  end

  private

  def webhook_delete
    context.shop.activate_session
    webhook = ShopifyAPI::Webhook.all.detect { |wk| wk.topic.eql?(context.params[:topic]) }
    context.fail!(error: 404, message: 'couldn\'t find webhook subscription') unless webhook

    webhook.destroy
    context.shop.webhooks.delete(context.params[:topic])
    context.shop.save
  ensure
    ShopifyAPI::Base.clear_session
  end
end
