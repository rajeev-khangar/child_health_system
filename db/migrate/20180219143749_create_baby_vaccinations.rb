class CreateBabyVaccinations < ActiveRecord::Migration[5.1]
  def change
    create_table :baby_vaccinations do |t|
      t.integer :baby_id
      t.integer :vaccination_id
      t.string :date
      t.string :batch_number
      t.string :dose_frequency
      t.timestamps
    end
  end
end
