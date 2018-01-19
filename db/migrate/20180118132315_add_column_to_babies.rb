class AddColumnToBabies < ActiveRecord::Migration[5.1]
  def change
  	add_column :babies, :height, :integer
  	add_column :babies, :weight, :integer
  	add_column :babies, :age, :integer
  end
end
