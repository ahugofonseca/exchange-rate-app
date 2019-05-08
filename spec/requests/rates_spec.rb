require 'rails_helper'

RSpec.describe "Rates", type: :request do
  describe "GET /rates" do
    it 'return success status' do
      get rates_path
      expect(response).to have_http_status(:success)
    end

    context 'when does not send parameters' do
      it 'currency default is defined' do
        get rates_path
        expect(response.body).to include('USDBRL')
      end
    end

    context 'when it has no valid query parameters' do
      it 'expect redirect to Rates#index' do
        get rates_path(currency: 'USDALL')
        expect(response).to redirect_to rates_path
      end
    end
  end
end
