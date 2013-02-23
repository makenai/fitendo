class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :user_id
      t.text   :response
      t.timestamps
    end
  end
end
