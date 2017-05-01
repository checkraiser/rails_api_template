class Ticket < ApplicationRecord
  include Tickets::Association, 
          Tickets::Validation
end
