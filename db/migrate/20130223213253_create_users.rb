class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_id
      t.date :start_date
      t.integer :cumulative_steps
      t.timestamps
    end
  end
end
