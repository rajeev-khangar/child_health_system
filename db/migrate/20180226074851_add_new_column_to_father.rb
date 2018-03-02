class AddNewColumnToFather < ActiveRecord::Migration[5.1]
  def change
    add_column :fathers, :baby_id, :integer
    remove_column :fathers, :phone_number, :integer
    add_column :fathers, :phone_number, :string
  end
end
