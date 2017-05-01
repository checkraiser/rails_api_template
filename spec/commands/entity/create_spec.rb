require 'rails_helper'

describe Entity::Create do
  let(:params) do
    HashBuilder.build email: 'dungth@hpu.edu.vn', first_name: 'Truong', last_name: 'Dung'
  end
  let(:params2) do
    HashBuilder.build email: 'dungth2@hpu.edu.vn', first_name: 'Truong 2', last_name: 'Dung 2'
  end
  let(:params3) do
    HashBuilder.build email: 'dungth3@hpu.edu.vn', first_name: 'Truong 3', last_name: 'Dung 3'
  end
  it 'successfully creates users' do
    Injector.inject(
      described_class, WithCommand, WithErrors, WithRepo, WithTransaction, WithParams
    ) do |command|
      cmd1 = command.use_repo(User).use_params(params)
      cmd2 = command.use_repo(User).use_params(params2)
      cmd3 = command.use_repo(User).use_params(params3)
      cmd = cmd1.with_transaction do
        cmd1.call.then(cmd2).then(cmd3)
      end
      expect(cmd).to be_success
      expect(User.count).to eql(3)
    end
  end
end