class Event < ApplicationRecord

    has_and_belongs_to_many :creators, join_table: :creators_events

    validates :name, presence: true
    validates :description, presence: true, length: { minimum: 10}
    validates :event_address, presence: true
    validates :date, presence: true

  end
  
