module Tickets::Validation
  extend ActiveSupport::Concern

  included do
    enum status: %i[open closed]
    validates :title, presence: true
    validates :body, presence: true
    validates :status, presence: true, inclusion: { in: statuses.keys }
  end
end
