class Api::V1::UsersController < Api::V1::BaseController
  def index
    users = User.all
    users = apply_filters(users, params)
    render(
      json: users,
      each_serializer: Api::V1::UserSerializer,
      root: 'users'
    )
  end
end
