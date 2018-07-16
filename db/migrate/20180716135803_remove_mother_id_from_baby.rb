class RemoveMotherIdFromBaby < ActiveRecord::Migration[5.1]
  def change
  	remove_column :babies, :mother_id
  	remove_column :babies, :father_id
  end
end
