##
# Handle command chaining with transaction support
module WithTransaction
  extend ActiveSupport::Concern

  included do
    include WithRepo
  end

  def with_transaction
    ApplicationRecord.transaction do
      yield if block_given?
    end
    self
  end

  def then(command)
    then_with_transaction(command)
  end

  def bind(command)
    bind_with_transaction(command)
  end

  private

  def bind_with_transaction(command)
    rollback unless success?
    cmd = command.call
    return cmd if cmd.success?
    add_errors cmd
    rollback
  end

  def then_with_transaction(command)
    rollback unless success?
    cmd = command.call
    return self if cmd.success?
    add_errors cmd
    rollback
  end

  def rollback
    raise ActiveRecord::Rollback
  end
end
