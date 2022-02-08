# frozen_string_literal: true

class AuthenticatedController < ApplicationController
  include ShopifyApp::Authenticated

  before_action :shop_origin
  before_action :host

  private

  def shop_origin
    @shop_origin = current_shopify_domain
  end

  def host
    @host = params[:host]
  end
end
