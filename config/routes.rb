require 'sidekiq/web'

Rails.application.routes.draw do
  mount NvShopAPI::Main, at: '/'
  mount ShopifyApp::Engine, at: '/'
  mount Sidekiq::Web, at: '/sidekiq'

  root to: 'home#index'

  get '/products_list', to: 'products#index'
  get '/webhooks_list', to: 'home#webhooks'
  get '/funnels_list', to: 'funnels#index'

  post '/custom_webhooks/:type', to: 'custom_webhooks#process_webhook'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
