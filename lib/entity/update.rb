##
# Update an entity
class Entity::Update
  def call
    model.assign_attributes params
    return model if model.save
    add_errors model
    nil
  rescue => e
    handle_exception e
  end
end
