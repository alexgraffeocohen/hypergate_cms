class OptionsController < ApplicationController
  def new
    option = Option.new(event: event)
    @presenter = OptionPresenter.new(option)
  end

  def create
    option = Option.new(option_params)
    remove_skill_check_if_empty(option)

    if option.save
      redirect_to encounter_path(encounter), notice: "Successfully saved option."
    else
      @presenter = OptionPresenter.new(option)
      flash[:error] = "There was a problem saving this option: #{option.errors.messages}"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    option = Option.find(params[:id])
    @presenter = OptionPresenter.new(option)
  end

  def update
    option = Option.find(params[:id])

    option.assign_attributes(option_params)
    remove_skill_check_if_empty(option)

    if option.save
      redirect_to encounter_path(encounter), notice: "Successfully saved option."
    else
      @presenter = OptionPresenter.new(option)
      flash[:error] = "There was a problem updating this option: #{option.errors.messages}"
      render :edit, status: :unprocessable_entity
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

  def remove_skill_check_if_empty(option)
    return if !option.skill_check

    skill_check = option.skill_check
    attributes = [skill_check.role, skill_check.difficulty, skill_check.description]

    unless attributes.any? { |attr| attr.present? }
      option.skill_check = nil
    end
  end

  def option_params
    params.
      require(:option).
      permit(
        :text,
        :order,
        skill_check_attributes: [:role_id, :difficulty, :description]
      ).
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
