require 'rails_helper'

##
# This class represents a test command
class TestCommand < ApplicationCommand
  prepend SimpleCommand

  def initialize(input)
    @input = input
  end

  def call
    @input + 1
  rescue => e
    errors.add self.class.name.downcase.to_sym, e.message
  end
end

describe TestCommand do
  let(:success_command) { described_class.call(3) }
  let(:failure_command) { described_class.call('3') }

  it_behaves_like('a success command') { subject { success_command } }
  it_behaves_like('a success command') { subject { success_command } }
  it_behaves_like('a success command') { subject { success_command.bind(described_class) } }
  it_behaves_like('a success command') { subject { success_command.transaction(described_class) } }
  it_behaves_like('a failure command') { subject { failure_command } }
  it_behaves_like('a failure command') { subject { failure_command.bind(described_class) } }
  it_behaves_like('a failure command') { subject { failure_command.transaction(described_class) } }
end
