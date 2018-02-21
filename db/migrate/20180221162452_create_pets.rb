class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :ownerPet
      t.string :namePet
      t.string :specie
      t.string :sex
      t.date :birthdate
      t.integer :weight

      t.timestamps
    end
  end
end
