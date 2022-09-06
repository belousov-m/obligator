require 'rails_helper'

RSpec.describe BondsController, type: :controller do
  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(300)
    end
  end
end
