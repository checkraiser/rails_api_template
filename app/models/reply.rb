class Reply < ApplicationRecord
  include Replies::Association
  include Replies::Validation
end
