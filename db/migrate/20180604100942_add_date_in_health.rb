class AddDateInHealth < ActiveRecord::Migration[5.1]
  def change
  	add_column :healths , :date, :datetime
  end
end
