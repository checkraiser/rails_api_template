module User::Validation
  extend ActiveSupport::Concern

  included do
    validates :email, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
  end
end
