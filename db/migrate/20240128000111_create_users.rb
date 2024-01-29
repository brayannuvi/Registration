class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.datetime :birthdate
      t.string :gender
      t.string :email
      t.string :address
      t.string :type_of_housing
      t.references :city, null: false, foreign_key: true
      t.string :extra_information

      t.timestamps
    end
  end
end
