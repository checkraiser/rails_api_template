##
# Support command with success?, result, errors
module WithCommand
  extend ActiveSupport::Concern

  included do
    prepend SimpleCommand
  end
end
