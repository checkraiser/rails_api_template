##
# Update an entity

class Entity::Update
  def call
    entity = model.assign_attributes params
    return entity if entity.save
    add_errors entity
    nil
  end
end
