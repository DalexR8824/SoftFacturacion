class AddBreedIdToPets < ActiveRecord::Migration[5.1]
  def change
    add_reference :pets, :breed, foreign_key: true
  end
end
