require 'rails_helper'

RSpec.describe Reply, type: :model do
  include_context 'with command' do
    include_context 'with customer and ticket' do
      include_context 'with support_agent' do
        include_context 'creates reply'
      end
    end
  end
end
