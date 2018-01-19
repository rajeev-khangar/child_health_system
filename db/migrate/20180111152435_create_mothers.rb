class CreateMothers < ActiveRecord::Migration[5.1]
  def change
    create_table :mothers do |t|
      
      t.string :first_name
      t.string :last_name
      t.string :national_id
      t.string :email
      t.string :date_of_birth
      t.integer :phone_number
      t.string :physical_address
      t.attachment :avatar
      t.string :id_document

      t.timestamps
    end
  end
end
