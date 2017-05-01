RSpec.shared_examples "success command" do
  it { is_expected.to be_success }
  it { expect(actual).to eql(actual) }
end

RSpec.shared_examples "failure command" do
  it { is_expected.to be_failure }
end
