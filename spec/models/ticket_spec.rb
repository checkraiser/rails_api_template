require 'rails_helper'

RSpec.describe Ticket, type: :model do
  subject                           { command.call }
  let(:actual)                      { subject.result }

  context 'with customer' do
    let(:customer)                  { create_customer }

    context 'creates ticket' do
      let(:command)                 { create_command_for(described_class, params) }
      let(:expected)                { described_class.customer.last }

      context 'with valid params' do
        let(:params)                { create_ticket_params_for(customer).to_h }  
        it_behaves_like 'success command'
      end

      context 'with empty title' do
        let(:params) do
          create_ticket_params_for(customer)
            .put(:title, '')
            .to_h
        end

        it_behaves_like 'failure command'
      end

      context 'with empty body' do
        let(:params) do
          create_ticket_params_for(customer)
            .put(:body, '')
            .to_h
        end

        it_behaves_like 'failure command'
      end
    end
  end
end
