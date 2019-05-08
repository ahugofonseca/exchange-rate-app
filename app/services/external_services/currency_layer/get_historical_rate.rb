module ExternalServices::CurrencyLayer
  class GetHistoricalRate
    BASE_URI = 'http://www.apilayer.net/api/'

    class << self
      def call(options)
        self.new(options).get_historical_rate
      end
    end

    def initialize(options)
      @access_key = Rails.application.credentials[:currency_layer][:access_key]
      @date = options[:date]
      @currency = options[:currency]
      @uri = build_uri
    end

    def get_historical_rate
      response = HTTParty.get(@uri)
      response.dig('quotes', @currency)
    end

    private

    def build_uri
      URI(
        "#{BASE_URI}historical"+
        "?access_key=#{@access_key}"+
        "&date=#{@date}"
      )
    end
  end
end
