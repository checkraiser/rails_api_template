RSpec.shared_context 'with customer and ticket' do
  let(:customer) { create_customer }
  let(:ticket)   { create_ticket_for(customer) }
end
