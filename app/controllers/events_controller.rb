class EventsController < ApplicationController
  def new
    event = Event.new(encounter: encounter)
    @presenter = EventPresenter.new(event)
  end

  def create
    event = Event.new(event_params)

    if event.save
      redirect_to encounter_path(encounter), notice: "Successfully saved event."
    else
      @event_presenter = EventPresenter.new(event)
      flash[:error] = "There was a problem saving this event: #{event.errors.messages}"
      render :new
    end
  end

  private

  def event_params
    params.
      require(:event).
      permit(:description).
      merge(encounter_id: encounter_id)
  end

  def encounter
    @encounter = Encounter.find(encounter_id)
  end

  def encounter_id
    params[:encounter_id]
  end
end
