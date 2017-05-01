##
# Support command with errors handling
module WithErrors
  extend ActiveSupport::Concern

  protected

  def add_errors(obj)
    if obj.errors.respond_to?(:messages)
      add_model_errors obj
    else
      add_command_errors obj
    end
  end

  def add_model_errors(model)
    model.errors.messages.each do |key, vals|
      vals.each do |val|
        errors.add key, val
      end
    end
  end

  def add_command_errors(command)
    command.errors.each do |key, vals|
      vals.each do |val|
        errors.add key, val
      end
    end
  end

  def handle_exception(e)
    errors.add self.class.name.downcase.to_sym, e.message
    self
  end
end
