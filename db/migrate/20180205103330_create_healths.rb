class CreateHealths < ActiveRecord::Migration[5.1]
  def change
    create_table :healths do |t|
      
      t.integer :baby_id
      t.integer :age
      t.float :height
      t.float :weight
      t.timestamps
    end
  end
end
