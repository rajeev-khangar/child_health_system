class CreateRiskFactors < ActiveRecord::Migration[5.1]
  def change
    create_table :risk_factors do |t|
      t.string :title
      t.timestamps
    end
  end
end
