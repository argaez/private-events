class DropEventsUsers < ActiveRecord::Migration[7.1]
  def change
    drop_table :events_users
  end
end
