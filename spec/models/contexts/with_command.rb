RSpec.shared_context 'with command' do
  subject          { command.call }

  let(:actual)     { subject.result }
end
