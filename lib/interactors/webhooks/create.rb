class Interactors::Webhooks::Create
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
    context.fail!(error: 422, message: 'couldn\'t create webhook') unless webhook_create
    context.response = { status: 200 }
  end

  private

  def webhook_create
    context.shop.activate_session
    ShopifyAPI::Webhook.create(address: ENV.fetch('WEBHOOK_URL'), topic: context.params[:topic])
    context.shop.webhooks << context.params[:topic] unless context.params[:topic].in?(context.shop.webhooks)
    context.shop.save
  ensure
    ShopifyAPI::Base.clear_session
  end

  def failed
    context.fail!(error: error)
  end
end
