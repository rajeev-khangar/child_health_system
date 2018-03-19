class CreateBabyInfantFeedings < ActiveRecord::Migration[5.1]
  def change
    create_table :baby_infant_feedings do |t|
      t.integer :baby_id
      t.integer :infant_feeding_label_id
      t.string :description
      t.integer :infant_feeding_month_id
      t.timestamps
    end
  end
end
