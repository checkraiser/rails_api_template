module ModelHelper
  def create_entity
    Entity::Create
  end

  def create_command_for(repo, params)
    Entity::Create.use(repo: repo, params: params)
  end

  def token_generator
    Token::Generate.use(repo: User, base64_generator: SecureRandom)
  end
end
