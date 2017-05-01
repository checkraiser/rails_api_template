module Tickets::Attributes
  extend ActiveSupport::Concern

  included do
    enum status: [:open, :closed]
  end
end
