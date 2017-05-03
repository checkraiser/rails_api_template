module Users::Validation
  extend ActiveSupport::Concern

  included do
    enum role: %i[support_agent customer]
    validates :email, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :role, presence: true, inclusion: { in: roles.keys }
    validates :authentication_token, uniqueness: true, allow_nil: true
  end
end
