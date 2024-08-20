class User < ApplicationRecord
  belongs_to :city
  validates :name, :last_name, :birthdate, :gender, :email, :address, :type_of_housing, :city_id, :extra_information, presence: true, allow_blank: false
  validate :amount_records, on: [:create , :update]
  validate :under_age, on: :create
  scope :cities, -> { joins(city: {department: :country}).select('users.*, cities.name as city_name, departments.name as department_name, countries.name as country_name').order(city_id: :asc) }
  scope :specific_city, ->(city_id) {joins(city: {department: :country}).select('users.*, cities.id as city_id, departments.id as department_id, countries.id as country_id').where(id: city_id).last} 

  def amount_records
    puts id
    city.users.pluck(:id)
    if city.users.size >= 3 && !city.users.pluck(:id).include?(id)
      errors.add(:base, 'No se puede registrar al usuario, puesto que no se pueden registrar más de 3 usuarios por ciudad.')
    end
  end
  
  def under_age
    if birthdate > 18.years.ago
      errors.add(:birthdate, 'No se puede registrar al usuario, puesto que no se pueden registrar usuarios menores de edad.')
    end
  end
end
