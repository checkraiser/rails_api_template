module WithParams
  extend ActiveSupport::Concern

  class_methods do
    def use_params(params)
      self.new.tap do |tmp|
        tmp.use_params(params)
      end
    end
  end

  def use_params(params)
    @_params = params
    self
  end
  
  private
  
  def params
    @_params
  end
end
