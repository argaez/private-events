class EventsController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authorize_creator, only: [:edit, :update, :destroy]

  #def index
      #@events = Event.all
  #end

  def index
    if params[:creator_id]
      @creator = Creator.find(params[:creator_id])
      @events = @creator.events
    else
      @events = Event.all
    end
  end
  
    # GET /events/:id
  # Muestra un evento específico
  def show
    @event = Event.find(params[:id])
  end

  # GET /events/new
  # Muestra el formulario para crear un nuevo evento
  def new
    @event = Event.new
  end

  # POST /events
  # Crea un nuevo evento
  def create
    @event = Event.new(event_params)

    # Asigna al usuario actual como creador si es un Creator
    if current_user.is_a?(Creator)
      @event.creators << current_user
    end

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /events/:id/edit
  # Muestra el formulario para editar un evento existente
  def edit
    @event = Event.find(params[:id])
  end

  # PATCH/PUT /events/:id
  # Actualiza un evento existente
  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /events/:id
  # Elimina un evento existente
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path, status: :see_other, notice: 'Event was successfully deleted.'
  end

  private

  # Método para buscar el evento por ID
  def set_event
    @event = Event.find(params[:id])
  end

  # Filtros para permitir solo a los creadores del evento editar o eliminar
  def authorize_creator
    unless @event.creators.include?(current_user)
      redirect_to events_path, alert: 'You are not authorized to modify this event.'
    end
  end

  # Permite los parámetros del formulario de eventos
  def event_params
    params.require(:event).permit(:name, :description, :event_address, :date, creator_ids: [])
  end

end
