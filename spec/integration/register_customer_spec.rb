require 'rails_helper'

RSpec.describe 'Register Customer' do
  subject do
    Command.return(register_params)
    .then(
      Command.transaction(
        create_customer_command
        .bind(token_generator, :model)
  )).then(create_admin_command)
    .bind(token_generator, :model)
    .then(create_support_agent_command)
    .bind(token_generator, :model)
  end

  let(:register_params) { create_customer_params }

  before do
    subject.run      
  end

  it { is_expected.to be_success }
  it { expect(User.customer.count).to eql(1) }
  it { expect(User.admin.count).to eql(1) }
  it { expect(User.support_agent.count).to eql(2) }
end
