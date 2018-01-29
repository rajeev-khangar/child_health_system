class AddColumnToFather < ActiveRecord::Migration[5.1]
  def change
  	add_column :fathers, :first_name, :string
  	add_column :fathers, :last_name, :string
  	add_column :fathers, :phone_number, :integer
  end
end
