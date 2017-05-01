RSpec.shared_context 'creates reply' do
  context 'creates reply' do
    let(:command)  { create_command_for(described_class, params) }
    let(:expected) { support_agent.replies.last }

    context 'with valid params' do
      let(:params) { create_reply_params_for(ticket, support_agent).to_h }

      it_behaves_like 'success command'
    end

    context 'with empty content' do
      let(:params) { create_reply_params_for(ticket, support_agent).put(:content, '').to_h }

      it_behaves_like 'failure command'
    end
  end
end
