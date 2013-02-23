class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :user_id
      t.text   :response
      t.date   :for_date
      t.integer :cumulative_steps
      t.timestamps
    end
  end
end
