class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string  :name,  null: false
      t.integer :point, null: false
      t.timestamps
    end
  end
end
