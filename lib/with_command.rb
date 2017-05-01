module WithCommand
  extend ActiveSupport::Concern

  included do
    prepend SimpleCommand
  end
end
