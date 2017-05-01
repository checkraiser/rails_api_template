require 'rails_helper'

RSpec.describe Ticket, type: :model do
  include_context 'with command' do
    include_context 'with customer' do
      include_context 'creates ticket'
    end
  end
end
