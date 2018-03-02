class CreateInfantFeedings < ActiveRecord::Migration[5.1]
  def change
    create_table :infant_feedings do |t|
      t.integer :baby_id
      t.string :breast_milk
      t.string :except_breast_milk
      t.boolean :breastfeeding_hour_delivery
      t.string :duration
      t.string :complementary_foods
      t.string :breastfeeding_continues
      t.string :food_groups_given_day
      t.string :no_of_meals_day
      t.timestamps
    end
  end
end
