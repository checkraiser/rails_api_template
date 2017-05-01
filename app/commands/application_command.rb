##
# This class represents a base command for other commands to inherit
class ApplicationCommand
  ##
  # This method allows binding result to other command to be called

  def bind(command)
    return command.call(result) if success?
    self
  end

  ##
  # This method allows binding result to other command to be called in a transaction.
  # All nested failure will allow the transaction to rollback changes in database

  def transaction(command)
    ApplicationRecord.transaction(requires_new: true) do
      if success?
        cmd = command.call result
        raise ActiveRecord::Rollback unless cmd.success?
        cmd
      else
        self
      end
    end
  end
end
