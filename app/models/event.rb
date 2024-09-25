class Event < ApplicationRecord

    has_and_belongs_to_many :creators, join_table: :creators_events
  end
  
