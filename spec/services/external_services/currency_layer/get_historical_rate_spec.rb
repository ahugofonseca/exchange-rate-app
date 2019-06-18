require 'rails_helper'

describe ExternalServices::CurrencyLayer::GetHistoricalRate do
  context 'when it has no valid parameters' do
    let(:options) { {date: DateTime.now, currency: 'USDBRL'} }

    it 'return response error' do
      response = ExternalServices::CurrencyLayer::GetHistoricalRate.call(options)
      expect(response).to be_nil
    end
  end

  context 'when it has valid parameters' do
    let(:options) { {date: Date.today, currency: 'USDBRL'} }

    it 'return number float' do
      response = ExternalServices::CurrencyLayer::GetHistoricalRate.call(options)
      expect(response).to be_an(Float)
    end
  end
end
