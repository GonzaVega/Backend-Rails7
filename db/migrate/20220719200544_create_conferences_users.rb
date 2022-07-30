class CreateConferencesUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :conferences_users, :id => false do |t|
      t.integer :conference_id
      t.integer :user_id
    end
  end
end
