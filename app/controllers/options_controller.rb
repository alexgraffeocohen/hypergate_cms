class OptionsController < ApplicationController
  def new
    option = Option.new(event: event)
    @presenter = OptionPresenter.new(option)
  end

  def create
    option = Option.new(option_params)

    if option.save
      redirect_to encounter_path(encounter), notice: "Successfully saved option."
    else
      @presenter = OptionPresenter.new(option)
      flash[:error] = "There was a problem saving this option: #{option.errors.messages}"
      render :new
    end
  end

  def edit
    option = Option.find(params[:id])
    @presenter = OptionPresenter.new(option)
  end

  def update
    option = Option.find(params[:id])

    if option.update_attributes(option_params)
      redirect_to encounter_path(encounter), notice: "Successfully saved option."
    else
      @presenter = OptionPresenter.new(option)
      flash[:error] = "There was a problem updating this option: #{option.errors.messages}"
      render :edit
    end
  end

  def destroy
    @option = Option.find(params[:id])

    if @option.destroy
      flash[:notice] = "Succesfully destroyed option."
      redirect_to encounter
    else
      flash[:error] = "Could not destroy option."
      redirect_to encounter
    end
  end

  private

  def option_params
    params.
      require(:option).
      permit(:text, :order).
      merge(event_id: event.id)
  end

  def event
    @event = Event.find(event_id)
  end

  def event_id
    params[:event_id]
  end

  def encounter
    event.encounter
  end
end
