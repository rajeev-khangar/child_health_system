class CreateCareLabels < ActiveRecord::Migration[5.1]
  def change
    create_table :care_labels do |t|
      t.string :title
      t.string :input_type
      t.integer :min_duration
      t.integer :max_duration
      t.timestamps
    end
  end
end
