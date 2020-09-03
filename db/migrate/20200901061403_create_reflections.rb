class CreateReflections < ActiveRecord::Migration[6.0]
  def change
    create_table :reflections do |t|
      t.datetime   :start_time, null: false
      t.string     :impression, null: false
      t.references :user,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
