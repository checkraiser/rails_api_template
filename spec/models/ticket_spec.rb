require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:status) }
  
  it { should belong_to(:user) }
  it { should have_many(:replies) }
end
