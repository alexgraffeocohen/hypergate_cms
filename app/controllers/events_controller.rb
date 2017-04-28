class EventsController < ApplicationController
  def new
    event = Event.new(encounter: encounter)
    @presenter = EventPresenter.new(event)
  end

  def create
    event = Event.new(event_params)
    service = CreateEvent.new(event: event, encounter: encounter)

    if service.save
      redirect_to encounter_path(encounter), notice: "Successfully saved event."
    else
      @presenter = EventPresenter.new(event)
      flash[:error] = "There was a problem saving this event: #{event.errors.messages}"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    event = Event.find(params[:id])
    @presenter = EventPresenter.new(event)
  end

  def update
    event = Event.find(params[:id])
    service = UpdateEvent.new(event, event_params)

    if service.save
      flash[:notice] = "Successfully updated event."
      redirect_to encounter_path(encounter)
    else
      @presenter = EventPresenter.new(event)
      flash[:error] = "There was a problem saving this event: #{event.errors.messages}"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    event = Event.find(params[:id])

    if event.destroy
      flash[:notice] = "Succesfully destroyed event."
      redirect_to encounter_path(encounter)
    else
      @event_presenter = EventPresenter.new(event)
      flash[:error] = "Could not destroy event."
      render :edit
    end
  end

  private

  def event_params
    params.
      require(:event).
      permit(
        :description,
        responses_attributes: [:role_id, :text],
        event_results_attributes: [:ship_effect_id, :amount]
      ).
      merge(encounter_id: encounter_id)
  end

  def encounter
    @encounter = Encounter.find(encounter_id)
  end

  def encounter_id
    params[:encounter_id]
  end
end
