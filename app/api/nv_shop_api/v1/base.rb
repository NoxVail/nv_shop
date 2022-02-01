class NvShopAPI::V1::Base < Grape::API
  version :v1, using: :path
  prefix 'nv_shop/api'

  default_format :json
  format :json

  before do
    shop
  end

  helpers do
    def declared_params
      declared(params, include_missing: false)
    end

    def shop
      @shop ||= Shop.find_by(shopify_domain: headers['Shopify-Domain'])
    end

    def respond_with(interactor_klass, entity = nil)
      Rails.logger.info ActiveSupport::LogSubscriber.new.send(:color, "Processing by #{interactor_klass.name}#", :red)
      Rails.logger.info ActiveSupport::LogSubscriber.new.send(:color, "Rendering with #{entity&.name}", :red)

      interactor = interactor_klass.(
        shop: shop,
        headers: headers,
        request: request,
        params: declared_params.deep_symbolize_keys
      )

      raise_error(interactor.error_code, interactor.error) if interactor.failure?

      present(interactor.response, with: entity)

    rescue ActiveResource::UnauthorizedAccess => e
      raise_error(401, e.message)
    end

    def raise_error(code, message, args = {}, redirect_uri = nil)
      redirect_uri = { 'Location' => redirect_uri } if redirect_uri
      error!({ error_code: code, error_message: message }.merge(args), code, redirect_uri)
    end
  end

  mount NvShopAPI::V1::Webhooks

  route :any, '*path' do
    raise_error(404, 'Endpoint Not Found')
  end
end
