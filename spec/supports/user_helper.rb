module UserHelper
  def create_customer
    create_entity
      .use_repo(User)
      .use_params(
        create_customer_params
          .to_h
      ).call
      .result
  end

  def create_support_agent
    create_entity
      .use_repo(User)
      .use_params(
        create_support_agent_params
        .to_h
      ).call
      .result
  end

  def create_admin
    create_entity
      .use_repo(User)
      .use_params(
        create_admin_params
        .to_h
      )
      .call
      .result
  end

  def create_customer_params
    create_params_with email:                 random_email,
                       first_name:            random_first_name,
                       last_name:             random_last_name,
                       password:              password,
                       password_confirmation: password,
                       role:                  customer_role
  end

  def create_support_agent_params
    create_params_with email:                 random_email,
                       first_name:            random_first_name,
                       last_name:             random_last_name,
                       password:              password,
                       password_confirmation: password
  end
  
  def create_admin_params
    create_params_with email:                 random_email,
                       first_name:            random_first_name,
                       last_name:             random_last_name,
                       admin:                 true,
                       password:              password,
                       password_confirmation: password
  end

  def password
    @_password ||= random_password
  end

  def customer_role
    'customer'
  end
end
