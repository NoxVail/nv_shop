class Interactors::Webhooks::Delete
  include Interactor
  include Interactor::Contracts

  expects do
    required(:shop).filled
    required(:params).schema do
      required(:topic).filled
    end
  end

  on_breach do |breaches|
    failed(breaches.map(&:messages).flatten)
  end

  def call
    context.fail!(error: 422, message: context.shop.errors) unless webhook_delete
    context.response = { status: 200 }
  end

  private

  def webhook_delete
    context.shop.activate_session
    webhook = ShopifyAPI::Webhook.all.detect { |wk| wk.topic.eql?(context.params[:topic]) }
    raise_error(404, 'couldn\'t find webhook subscription') unless webhook

    webhook.destroy
    context.shop.webhooks.delete(context.params[:topic])
    context.shop.save
  ensure
    ShopifyAPI::Base.clear_session
  end

  def failed(error)
    context.fail!(error: error)
  end
end
