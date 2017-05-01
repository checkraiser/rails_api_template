module Replies::Association
  extend ActiveSupport::Concern

  included do
    belongs_to :ticket
    belongs_to :user
  end
end
