class AddConferenceColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :conference
  end
end
