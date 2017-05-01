module ModelHelper
  def create_entity
    Entity::Create
  end

  def create_command_for(repo, params)
    create_entity.use_repo(repo).use_params(params)
  end
end
