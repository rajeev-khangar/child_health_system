class AddColumnToMother < ActiveRecord::Migration[5.1]
  def change
    add_column :mothers, :baby_id, :integer
    remove_column :mothers, :phone_number, :integer
    add_column :mothers, :phone_number, :string
  end
end
