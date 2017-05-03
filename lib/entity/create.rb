##
# Create new entity
class Entity::Create
  def call
    entity = repo.new params
    entity.save!
    entity
  end    
end
