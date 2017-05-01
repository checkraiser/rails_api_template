##
# Create new entity
class Entity::Create
  def call
    entity = repo.new params
    return entity if entity.save
    add_errors entity
    nil
  rescue => e
    handle_exception e
  end
end
