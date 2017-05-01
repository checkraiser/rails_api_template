module Replies::Validation
  extend ActiveSupport::Concern

  included do
    validates :content, presence: true
  end
end
