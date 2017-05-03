##
# Support command with success?, result, errors
module Command
  extend ActiveSupport::Concern

# Monadic
  def self.return(value)
    klass = Class.new(Object) do
      attr_accessor :value

      def call
        value
      end
    end

    obj = klass.include(self).new
    obj.value = value
    obj
  end

  def self.lift(&proc)
    klass = Class.new(Object) do
      attr_accessor :proc

      def call
        proc.call(*params)
      end
    end
    obj = klass.include(self).new
    obj.proc = proc
    obj
  end

  def fmap(command, &proc)
    command.run unless command.executed?
    return command unless command.success?
    Command.return(proc.(command.result))
  end

  def then(command)
    self.run unless executed?
    return self unless success?
    command
  end
  
  def bind(command, input)
    self.run unless executed?
    return self unless success?
    command.instance_variable_set("@_#{input}", result)
    command.define_singleton_method(input) do
      instance_variable_get("@_#{input}")
    end
    command
  end

  def apply(commands = {})
    return self if commands.empty?
    commands.each do |key, cmd|
      cmd.run unless cmd.executed?
      if cmd.success?
        instance_variable_set("@_#{key}", cmd.result)
        define_singleton_method(key) do
          instance_variable_get("@_#{key}")
        end
      else
        add_errors cmd
        self
      end
    end
    run
  end

  def self.transaction(command)
    res = nil
    ActiveRecord::Base.transaction do
      res = command.run
      raise ActiveRecord::Rollback unless res.success?
    end
    res
  rescue => e
    res
  end

  included do
    prepend SimpleCommand

    def self.run
      command = self.new
      command.run
      command
    end

    def self.apply(*commands)
      command = self.use
      command.apply(*commands)
      command
    end

    def self.use(deps = {})
      command = self.new
      command.use(deps)
      command
    end
  end

  def run
    return self if executed?
    call
    @_executed = true
    self
  rescue => e
    handle_exception e
  end

  def use(deps = {})
    return self if deps.empty?
    deps.each do |key, val|
      define_singleton_method(key) do
        instance_variable_set("@_#{key}", val)
      end
    end
    self
  end

  protected

  def executed?
    @_executed || false
  end

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
