class Ticket < ApplicationRecord
  include Tickets::Association, 
          Tickets::Validation, 
          Tickets::Attributes
end
