class CreateTotalPoints < ActiveRecord::Migration[6.0]
  def change
    create_table :total_points do |t|
      t.integer    :point,      null: false
      t.references :reflection, null: false, foreign_key: true
      t.timestamps
    end
  end
end
