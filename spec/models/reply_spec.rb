require 'rails_helper'

RSpec.describe Reply, type: :model do
  let(:admin)  { create_admin }
  let(:user)   { create_user }
  let(:ticket) { create_ticket(user) }
  
  context 'creates reply' do
    subject                         { create_command.call }
    let(:result)                    { subject.result }
    let(:create_params)             { create_reply_params_for(user, ticket) }
    let(:create_command)            { create_command_for(described_class, create_params) }
    let(:created_reply_for_ticket)  { ticket.replies.first }
    let(:created_reply_for_user)    { user.replies.first }


    context 'successfully' do
      it { is_expected.to be_success }
      it { expect(result).to eql(created_reply_for_user) }
      it { expect(result).to eql(created_reply_for_ticket) }
    end

    context 'fail when content is empty' do
      let(:create_params)          { create_params_with(content: '') }

      it { is_expected.to be_failure }
    end
  end
end
