class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :full_name, presence: true, length: { minimum: 3, maximum: 50 }

  # Validación para el número de teléfono
  validates :phone, presence: true, 
                    format: { with: /\A\d+\z/, message: "only allows numbers" }, 
                    length: { minimum: 10, maximum: 15 }

  # Validación para el estado activo
  validates :active, inclusion: { in: [true, false], message: "must be true or false" }

  # Validación para la dirección
  validates :address, presence: true, length: { minimum: 5, maximum: 100 }

  # Validación para el nombre de usuario (username)
  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }

  # Validación para la fecha de nacimiento
  validates :birthday, presence: true, comparison: { less_than: Date.today, message: "must be in the past" }
end
