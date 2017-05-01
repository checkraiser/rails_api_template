require 'rails_helper'

RSpec.describe User, type: :model do
  include_context 'with command' do
    include_context 'creates customer'
  end
end
