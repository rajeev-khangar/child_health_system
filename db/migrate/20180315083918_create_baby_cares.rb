class CreateBabyCares < ActiveRecord::Migration[5.1]
  def change
    create_table :baby_cares do |t|
      t.integer :baby_id
      t.integer :care_label_id
      t.string :description
      t.string :comment
      t.integer :care_month_id
      t.timestamps
    end
  end
end
