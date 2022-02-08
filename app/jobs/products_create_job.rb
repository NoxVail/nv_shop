class ProductsCreateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    p args
  end
end
