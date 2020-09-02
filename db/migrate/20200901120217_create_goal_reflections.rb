class CreateGoalReflections < ActiveRecord::Migration[6.0]
  def change
    create_table :goal_reflections do |t|
      t.references :goal,       null: false, foreign_key: true
      t.references :reflection, null: false, foreign_key: true
      t.timestamps
    end
  end
end
