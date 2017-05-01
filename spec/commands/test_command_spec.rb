require 'rails_helper'

describe TestCommand, '#call' do
  context 'returns success' do
    subject { described_class.call(3) }

    it 'calls' do
      expect(subject.result).to eql(4)
    end

    it 'binds' do
      expect(subject.bind(described_class).result).to eql(5)
    end

    it 'transaction' do
      expect(subject.transaction(described_class).result).to eql(5)
    end
  end

  context 'returns errors' do
    subject { described_class.call('3') }
    let(:error_message) { { testcommand: ['no implicit conversion of Integer into String'] } }

    it '#calls' do
      expect(subject.errors).to eql error_message
    end

    it '#binds' do
      expect(subject.bind(described_class).errors).to eql error_message
    end

    it '#transaction' do
      expect(subject.transaction(described_class).errors).to eql error_message
    end
  end

  context 'returns exception errors' do
    subject { described_class.call(3).bind(Object.new) }

    it 'calls' do
      p subject.result
    end
  end
end
