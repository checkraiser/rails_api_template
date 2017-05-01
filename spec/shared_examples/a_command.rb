shared_examples_for 'a success command' do
  it { is_expected.to be_success }
end

shared_examples_for 'a failure command' do
  it { is_expected.to be_failure }
end
