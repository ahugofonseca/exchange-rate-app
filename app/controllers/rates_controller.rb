class RatesController < ApplicationController
  before_action :set_days

  def index
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: 'Grafico de cotação monetária')
      f.options[:xAxis][:categories] = @days
      f.series(
        type: 'spline',
        name: 'Cotação do Dolar',
        data: set_values
      )
    end
  end

  private

  def set_days
    @days = []
    (6).downto(0) {|day| @days << "#{Date.today-day}" }
  end

  def set_values
    @days.map do |day|
      ExternalServices::CurrencyLayer::GetHistoricalRate.call({date: day, currency: 'USDBRL'})
    end
  end
end
