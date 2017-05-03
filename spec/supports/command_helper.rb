module CommandHelper
  def create_customer_command
    Entity::Create.use(repo: User).use(params: create_customer_params.to_h)
  end

  def create_admin_command
    Entity::Create.use(repo: User).use(params: create_admin_params.to_h)
  end

  def create_support_agent_command
    Entity::Create.use(repo: User).use(params: create_support_agent_params.to_h)
  end
end
