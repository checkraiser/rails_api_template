##
# This class represents a base command for other commands to inherit
class ApplicationCommand
  prepend SimpleCommand

  ##
  # This method allows binding result to other command to be called

  def bind(command)
    return command.call(result) if success?
    self
  rescue => e
    errors.add self.class.name.downcase.to_sym, e.message
    self
  end

  ##
  # This method allows binding result to other command to be called in a transaction.
  # All nested failure will allow the transaction to rollback changes in database

  def transaction(command)
    ApplicationRecord.transaction(requires_new: true) do
      return self unless success?
      cmd = command.call result
      return cmd if cmd.success?
      raise ActiveRecord::Rollback
    end
  rescue => e
    errors.add self.class.name.downcase.to_sym, e.message
    self
  end

  ##
  # This method allows ignore result and let other command to be called

  def then(command)
    return command.call if success?
    self
  rescue => e
    errors.add self.class.name.downcase.to_sym, e.message
    self
  end
end
