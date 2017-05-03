require 'rails_helper'

RSpec.describe Token::Generate do
  let(:customer) { create_customer }
  
  subject do
    token_generator.use(model: customer).run
  end

  it { is_expected.to be_success }
end
