class CreateInfantFeedingLabelAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :infant_feeding_label_answers do |t|
      t.integer :infant_feeding_label_id
      t.string :description
      t.timestamps
    end
  end
end
