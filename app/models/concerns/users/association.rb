module Users::Association
  extend ActiveSupport::Concern

  included do
    has_many :tickets
    has_many :replies

    scope :admin, -> { where(admin: true) }
  end
end
