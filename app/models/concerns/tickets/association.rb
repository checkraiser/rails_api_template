module Tickets::Association
  extend ActiveSupport::Concern

  included do
    belongs_to :user
    has_many :replies
  end
end
