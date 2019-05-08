module Charts
  class BuildRatesCharts
    class InvalidCurrency < StandardError; end

    class << self
      def call(currency)
        self.new(currency).build_rates_charts
      end
    end

    def initialize(currency)
      @currency = currency
      raise InvalidCurrency if is_invalid_currency?
      set_days
    end

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

    private

    def set_days
      @days = []
      (6).downto(0) {|day| @days << "#{Date.today-day}" }
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
