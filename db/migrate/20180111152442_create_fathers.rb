class CreateFathers < ActiveRecord::Migration[5.1]
  def change
    create_table :fathers do |t|

      
      t.integer :national_id
      t.string :email
      t.string :date_of_birth
      t.string :physical_address
      t.attachment :avatar
      t.string :id_document

      t.timestamps
    end
  end
end
