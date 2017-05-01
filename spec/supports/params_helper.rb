module ParamsHelper
  def create_params_with(params)
    Hamster::Hash[params]
  end
end
