module WithModel
  extend ActiveSupport::Concern

  class_methods do
    def use_model(model)
      self.new.tap do |tmp|
        tmp.use_model(model)
      end
    end
  end

  def use_model(model)
    @_model = model
    self
  end
  
  private
  
  def model
    @_model
  end
end
