class Persona < ActiveRecord::Base
  has_secure_password

  validates :nombre, presence: true

  has_many :eventos, dependent: :destroy

  def to_s
    [nombre, apellido].join(' ')
  end

  def self.con_nombre(nombre)
    where(
      'LOWER(nombre) LIKE :nombre OR LOWER(apellido) LIKE :nombre',
      nombre: "#{nombre}%".downcase
    )
  end
end
