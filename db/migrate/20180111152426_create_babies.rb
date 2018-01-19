class CreateBabies < ActiveRecord::Migration[5.1]
  def change
    create_table :babies do |t|
      t.integer :mother_id
      t.integer :father_id
      t.integer :user_id
      t.integer :hospital_id
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :sex
      t.string :date_of_birth	
      t.string :place_of_birth
      t.string :health_center
      t.string :physical_address
      t.attachment :avatar
      
      t.timestamps
    end
  end
end
