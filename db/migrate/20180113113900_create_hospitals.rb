class CreateHospitals < ActiveRecord::Migration[5.1]
  def change
    create_table :hospitals do |t|
       
      t.string :name
      t.string :subdomain
      t.references :creator, polymorphic: true, index: true 
      t.timestamps
    end
  end
end
