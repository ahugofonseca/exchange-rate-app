require 'rails_helper'

describe Charts::BuildRatesCharts do
  let(:currency) { 'USDBRL' }
  let(:invalid_currency) { 'USDALL' }

  context 'when use a valid currency' do
    it 'return a HighChart object' do
      chart = Charts::BuildRatesCharts.new(currency).call
      expect(chart).to be_an(LazyHighCharts::HighChart)
    end

    it 'received values to graph' do
      chart = Charts::BuildRatesCharts.new(currency)
      expect(chart.send(:set_values).any?).to be_truthy
    end
  end

  context 'when use a invalid currency' do
    it 'return excpetion' do
      expect{Charts::BuildRatesCharts.new(invalid_currency).call}.to raise_exception{Charts::BuildRatesCharts::InvalidCurrency}
    end
  end
end
