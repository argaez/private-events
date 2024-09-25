class CreateEventsCreatorsJoinTable < ActiveRecord::Migration[7.1]
  
  def change

    create_join_table :creators, :events

  end

end
