Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  root to: 'home#index'
  get '/products', to: 'products#index'
  get '/webhooks', to: 'home#webhooks'
  mount NvShopAPI::Main, at: '/'
  mount ShopifyApp::Engine, at: '/'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
