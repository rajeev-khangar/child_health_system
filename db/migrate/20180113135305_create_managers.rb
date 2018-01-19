class CreateManagers < ActiveRecord::Migration[5.1]
  def change
    create_table :managers do |t|

      t.timestamps
    end
  end
end
