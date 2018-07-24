require 'rails_helper'

RSpec.describe 'Api::V1::Meals', type: :request do
  let(:url) { '/api/v1/meals' }

  describe 'GET /api/v1/meals' do
    let!(:meal_1) { create(:meal, eaten_on: '2018-07-11') }
    let!(:meal_2) { create(:meal, eaten_on: '2018-07-18') }

    before(:each) { get url }

    it { expect(response).to be_successful }

    it 'returns meals' do
      json = JSON.parse(response.body)
      expect(json['data'].length).to eq(2)
    end

    context 'with filter' do
      let(:url) { '/api/v1/meals?filter[eaten_on][gte]=2018-07-09&filter[eaten_on][lte]=2018-07-15' }

      it 'return meals only meals matching filter' do
        json = JSON.parse(response.body)
        expect(json['data'].length).to eq(1)
      end
    end
  end

  describe 'POST /api/v1/meals' do
    let(:params) do
      {
        data: {
          type: 'meals',
          attributes: attributes_for(:meal)
        }
      }
    end

    before(:each) { post url, params: params }

    it { expect(response).to be_created }
  end
end
