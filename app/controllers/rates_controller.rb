class RatesController < ApplicationController
  before_action :set_currency, only: %i(index)

  def index
    @chart = Charts::BuildRatesCharts.call(@currency)
  end

  private

  def set_currency
    @currency = params[:currency].present? ? params[:currency] : 'USDBRL'
  end
end
