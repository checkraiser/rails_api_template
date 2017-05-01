require 'rails_helper'

RSpec.describe User, type: :model do
  subject                           { command.call }
  let(:actual)                      { subject.result }

  context 'creates customer' do
    let(:command)                   { create_command_for(described_class, params) }
    let(:expected)                  { described_class.customer.last }

    context 'with valid params' do
      let(:params)                  { create_customer_params.to_h }  
      it_behaves_like 'success command'
    end

    context 'with empty password' do
      let(:params) do
        create_customer_params
          .put(:password, '')
          .to_h
      end

      it_behaves_like 'failure command'
    end

    context 'when password and confirmation does not match' do
      let(:params) do
        create_customer_params
          .put(:password, random_password)
          .put(:password_confirmation, random_password)
          .to_h
      end

      it_behaves_like 'failure command'
    end
  end
end
