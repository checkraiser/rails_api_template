require 'rails_helper'

RSpec.describe Api::V1::HomeController, type: :controller do
  context 'as a guest' do
    describe 'GET index' do
      it 'returns correct types' do
        get :index, format: :json
        expect_json_types(foo: :string)
        expect_json(foo: 'Dung')
      end
    end
  end
end
