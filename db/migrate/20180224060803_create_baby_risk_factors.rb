class CreateBabyRiskFactors < ActiveRecord::Migration[5.1]
  def change
    create_table :baby_risk_factors do |t|
      t.integer :baby_id
      t.integer :risk_factor_id
      t.timestamps
    end
  end
end
