require 'rails_helper'

RSpec.describe User, type: :model do
  let(:params) do
    HashBuilder.build email: 'dungth@hpu.edu.vn', first_name: 'Truong', last_name: 'Dung'
  end
  let(:params2) do
    HashBuilder.build email: 'dungth2@hpu.edu.vn', first_name: 'Truong 2', last_name: 'Dung 2'
  end
  let(:params3) do
    HashBuilder.build email: 'dungth3@hpu.edu.vn', first_name: 'Truong 3', last_name: 'Dung 3'
  end
  let(:create_command) { Entity::Create }
  let(:cmd1) { create_command.use_repo(described_class).use_params(params) }
  let(:cmd2) { create_command.use_repo(described_class).use_params(params2) }
  

  it 'successfully creates users' do
    cmd3 = create_command.use_repo(described_class).use_params(params3)
    cmd = cmd1.with_transaction do
      cmd1.call.then(cmd2).then(cmd3)
    end
    expect(cmd).to be_success
    expect(User.count).to eql(3)
  end

  it 'fails creating users' do
    cmd3 = create_command.use_repo(described_class).use_params(params)
    cmd = cmd1.with_transaction do
      cmd1.call.then(cmd2).then(cmd3)
    end
    expect(cmd).to be_failure
    expect(User.count).to eql(0)
  end
end
