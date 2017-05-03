##
# Update an entity
class Entity::Update
  def call
    model.assign_attributes params
    model.save!
  end
end
