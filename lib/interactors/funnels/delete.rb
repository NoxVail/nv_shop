class Interactors::Funnels::Delete < Interactors::Base
  expects do
    required(:shop).filled
    required(:funnel).filled
  end

  def call
    funnel_delete
  end

  private

  def funnel_delete
    context.fail!(error: 422, message: context.funnel.errors) unless context.funnel.destroy
  end
end
