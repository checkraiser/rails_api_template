class TestCommand < ApplicationCommand
  prepend SimpleCommand
  
  def initialize(input)
    @input = input
  end

  def call
    @input + 1
  rescue => e 
    errors.add self.class.name.downcase.to_sym, e.message
  end
end
