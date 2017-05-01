class Api::V1::HomeController < Api::V1::BaseController
  def index
    render json: { foo: 'Dung' }
  end
end
