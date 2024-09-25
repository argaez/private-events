class EventsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @events = Event.includes(:creators).all
  end
end
