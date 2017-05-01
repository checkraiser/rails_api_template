class Ticket < ApplicationRecord
  include Tickets::Association
  include Tickets::Validation
end
