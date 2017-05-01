class Reply < ApplicationRecord
  include Replies::Association, 
          Replies::Validation
end
