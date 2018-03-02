class CreateCares < ActiveRecord::Migration[5.1]
  def change
    create_table :cares do |t|
      t.integer :baby_id
      t.string :arv_supplied
      t.string :ctx_supplied
      t.string :initial_used
      t.string :initial_done
      t.string :initial_number
      t.string :initial_result
      t.string :initial_referred_art
      t.string :initial_initiated_art
      t.string :repeat_used
      t.string :repeat_done
      t.string :repeat_number
      t.string :repeat_result
      t.string :repeat_referred_art
      t.string :repeat_initiated_art
      t.string :breastfeeding_used
      t.string :breastfeeding_done
      t.string :breastfeeding_number 
      t.string :breastfeeding_result 
      t.string :breastfeeding_referred_art 
      t.string :breastfeeding_initiated_art  
      t.string :comments
      t.boolean :mother_art
      t.boolean :arv_prophylaxis_given_at_birth
      t.string :arv_prophylaxis_name
      t.timestamps
    end
  end
end
