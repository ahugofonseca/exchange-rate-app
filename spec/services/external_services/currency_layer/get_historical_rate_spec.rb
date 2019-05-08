require 'rails_helper'

describe ExternalServices::CurrencyLayer::GetHistoricalRate do
  let(:options) { {date: Date.today, currency: 'USDBRL'} }

  it 'return number float' do
    response = ExternalServices::CurrencyLayer::GetHistoricalRate.call(options)
    expect(response).to be_an(Float)
  end
end
