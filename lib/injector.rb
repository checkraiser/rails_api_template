module Injector
  def self.provide(klass, *modules, &block)
    modules.each do |mod|
      klass.include mod
    end
    block.call(klass)
    modules.each do |mod|
      mod.instance_methods.each do |meth|
        klass.send(:undef_method, meth)
      end
    end
  end

  def self.inject(klass, *modules)
    modules.each do |mod|
      klass.include mod
    end
  end
end
