class CreateVaccinations < ActiveRecord::Migration[5.1]
  def change
    create_table :vaccinations do |t|	
      t.integer :age	
      t.string :title
      t.string :description
      t.timestamps
    end
  end
end
