class UsersAddedToConferencesAsSpeakers < ActiveRecord::Migration[7.0]
  def change
    add_column :conferences, :user_id, :int
  end
end
