class CreateConferences < ActiveRecord::Migration[7.0]
  def change
    create_table :conferences do |t|
      t.string :title
      t.text :abstract
      t.integer :room
      t.integer :speaker
      t.integer :attendees

      t.timestamps
    end
  end
end
