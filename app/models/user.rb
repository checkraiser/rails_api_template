class User < ApplicationRecord
  include Users::Association, 
          Users::Validation
end
