##
# JSON Serializer for User model
class Api::V1::UserSerializer < Api::V1::BaseSerializer
  attributes :id, :email
end
