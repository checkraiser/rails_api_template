class Api::V1::CustomersController < Api::V1::BaseController
  def index
    users = User.customer.all
    users = apply_filters(users, params)
    render(
      json: users,
      each_serializer: Api::V1::UserSerializer,
      root: 'users'
    )
  end

  def register
    Command.transaction do
        create_customer.run
          .then(token_generator, :model)
          .run
    end                 
  end
end
