class User < ApplicationRecord
  has_secure_password
  include Users::Association, 
          Users::Validation
end
