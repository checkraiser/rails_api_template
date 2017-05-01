module UserHelper
  def create_user
    create_entity
      .use_repo(User)
      .use_params(user_params)
      .call
      .result
  end

  def user_params
    create_params_with email:      random_email,
                       first_name: random_first_name,
                       last_name:  random_last_name
  end

  def create_admin
    create_entity
      .use_repo(User)
      .use_params(admin_params)
      .call
      .result
  end

  def admin_params
    create_params_with email:      random_email,
                       first_name: random_first_name,
                       last_name:  random_last_name,
                       admin:      true
  end
end
