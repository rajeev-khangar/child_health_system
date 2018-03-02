class CreateVitaminAs < ActiveRecord::Migration[5.1]
  def change
    create_table :vitamin_as do |t|
      
      t.integer :baby_id
      t.string  :month_duration
      t.string :title
      t.timestamps
    end
  end
end
