class FieldsToUser < ActiveRecord::Migration[5.1]
  def change
	add_column :users, :name, :string
	add_column :users, :lastName, :string
	add_column :users,:celPhone, :string 
	add_column :users,:address, :string
	add_column :users, :status, :string 
      
  end
end
