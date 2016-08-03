class EncountersController < ApplicationController
  def index
    @encounters = Encounter.all
  end

  def new
    @encounter = Encounter.new
    @encounter_presenter = NewEncounterPresenter.new(@encounter)
  end

  def create
    @encounter = NewEncounterService.new(encounter_params).encounter

    if @encounter.save
      redirect_to encounters_path, notice: "Successfully saved encounter."
    else
      byebug
      @encounter_presenter = NewEncounterPresenter.new(@encounter)
      render :new
    end
  end

  private

  def encounter_params
    params.
      require(:encounter).
      permit(:category,
             :description,
             responses: ["engineer",
                         "medical officer",
                         "pilot",
                         "science officer",
                         "weapons officer",
                         "communications officer"],
             options: ["1", "2", "3", "4"])
  end
end
