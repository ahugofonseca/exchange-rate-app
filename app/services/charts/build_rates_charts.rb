module Charts
  class BuildRatesCharts
    class InvalidCurrency < StandardError; end

    def initialize(currency)
      @currency = currency
      raise InvalidCurrency if is_invalid_currency?
      set_days
    end

    def call
      build_rates_charts
    end

    private

    def build_rates_charts
      LazyHighCharts::HighChart.new('graph') do |f|
        f.title(text: 'Grafico de cotação monetária')
        f.options[:xAxis][:categories] = @days
        f.series(
          type: 'spline',
          name: I18n.t("currency.initials.#{@currency}"),
          data: set_values
        )
      end
    end

    def set_days
      @days = []
      (6).downto(0) {|day| @days << "#{Date.today-day}" }
      # (6).downto(0) {|day| @days << "#{(Date.today-day).strftime('%d/%m/%Y')}" }
    end

    def set_values
      @days.map do |day|
        ExternalServices::CurrencyLayer::GetHistoricalRate.call({date: day, currency: @currency})
      end
    end

    def is_invalid_currency?
      ['USDBRL', 'USDEUR', 'USDARS'].exclude?(@currency)
    end
  end
end
