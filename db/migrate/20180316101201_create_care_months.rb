class CreateCareMonths < ActiveRecord::Migration[5.1]
  def change
    create_table :care_months do |t|
      t.string :title
      t.integer :order
      t.timestamps
    end
  end
end
