class RatesController < ApplicationController
  before_action :set_currency, only: %i(index)

  def index
    @chart = Charts::BuildRatesCharts.call(@currency)
  rescue Charts::BuildRatesCharts::InvalidCurrency
    flash[:alert] = 'Esta moeda é invalida'
    redirect_to rates_path
  end

  private

  def set_currency
    @currency = params[:currency].present? ? params[:currency] : 'USDBRL'
  end
end
