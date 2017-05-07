class FailureEventsController < ApplicationController
  def new
    event = Event.new(encounter: encounter)
    @presenter = FailureEventPresenter.new(event: event, option: option)
  end

  def create
    event = Event.new(event_params)
    service = CreateFailureEvent.new(
      event: event,
      option: option
    )

    if service.save
      redirect_to encounter_path(encounter), notice: "Successfully saved event."
    else
      @presenter = FailureEventPresenter.new(event: event, option: option)
      flash[:error] = "There was a problem saving this event: #{event.errors.messages}"
      render :new, status: :unprocessable_entity
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

  def option
    @option = Option.find(params[:option_id])
  end
end
