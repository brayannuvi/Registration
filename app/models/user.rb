class User < ApplicationRecord
  belongs_to :city
  validates :name, :last_name, :birthdate, :gender, :email, :address, :type_of_housing, :city_id, :extra_information, presence: true, allow_blank: false
  validate :amount_records, on: :create
  validate :under_age, on: :create

  def amount_records
    if city.users.size >= 3
      errors.add(:base, 'No se puede registrar al usuario, puesto que no se pueden registrar más de 3 usuarios por ciudad.')
    end
  end
  
  def under_age
    if birthdate > 18.years.ago
      errors.add(:birthdate, 'No se puede registrar al usuario, puesto que no se pueden registrar usuarios menores de edad.')
    end
  end
end
