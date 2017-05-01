require 'rails_helper'

RSpec.describe Reply, type: :model do
  subject                           { command.call }
  let(:actual)                      { subject.result }
  let(:customer)                    { create_customer }
  let(:ticket)                      { create_ticket_for(customer) }

  context 'with support agent' do
    let(:support_agent)             { create_support_agent }

    context 'creates reply' do
      let(:command)                 { create_command_for(described_class, params) }
      let(:expected)                { support_agent.replies.last }

      context 'with valid params' do
        let(:params)                { create_reply_params_for(ticket, support_agent).to_h }

        it_behaves_like 'success command'
      end

      context 'with empty content' do
        let(:params)                { create_reply_params_for(ticket, support_agent).put(:content, '').to_h }

        it_behaves_like 'failure command'
      end
    end
  end
end
