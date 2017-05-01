module Tickets::Validation
  extend ActiveSupport::Concern

  included do
    validates :title, presence: true
    validates :body, presence: true
    validates :status, presence: true, inclusion: { in: Ticket.statuses.keys }
  end
end
