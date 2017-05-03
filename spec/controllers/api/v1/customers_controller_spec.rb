require 'rails_helper'

RSpec.describe Api::V1::CustomersController, type: :controller do
  describe 'GET index' do
    include_context 'with random users' do
      it 'returns correct types' do
        get :index, format: :json
        p json_body
        # expect_json_types(foo: :string)
        # expect_json(foo: 'Dung')
      end
    end
  end
end
