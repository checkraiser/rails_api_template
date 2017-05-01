module WithTransaction
  extend ActiveSupport::Concern

  included do
    include WithRepo
  end

  def with_transaction(&block)
    ApplicationRecord.transaction do
      block.call
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
    if success?
      cmd = command.call
      if cmd.success?
        return cmd
      else
        add_errors cmd
        rollback
      end
    else
      rollback
    end
  end

  def then_with_transaction(command)
    if success?
      cmd = command.call
      if cmd.success?
        return self
      else
        add_errors cmd
        rollback
      end
    else
      rollback
    end
  end

  def rollback
    raise ActiveRecord::Rollback
  end
end
