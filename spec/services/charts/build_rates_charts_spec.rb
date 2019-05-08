require 'rails_helper'

describe Charts::BuildRatesCharts do
  let(:currency) { 'USDBRL' }
  let(:invalid_currency) { 'USDALL' }

  context 'when use a valid currency' do
    it 'return a HighChart object' do
      chart = Charts::BuildRatesCharts.call(currency)
      expect(chart).to be_an(LazyHighCharts::HighChart)
    end
  end

  context 'when use a invalid currency' do
    it 'return excpetion' do
      expect{Charts::BuildRatesCharts.call(invalid_currency)}.to raise_exception{Charts::BuildRatesCharts::InvalidCurrency}
    end
  end
end
