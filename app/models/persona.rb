class Persona < ActiveRecord::Base
  has_secure_password

  validates :nombre, presence: true
end
