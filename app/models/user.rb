class User < ApplicationRecord
  has_secure_password
  include Users::Association
  include Users::Validation
end
