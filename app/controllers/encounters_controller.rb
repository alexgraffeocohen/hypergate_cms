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
      @encounter_presenter = NewEncounterPresenter.new(@encounter)
      flash[:error] = "There was a problem saving this encounter."
      render :new
    end
  end

  def destroy
    @encounter = Encounter.find(params[:id])

    if @encounter.destroy
      flash[:notice] = "Succesfully destroyed encounter."
      redirect_to encounters_path
    else
      flash[:error] = "Could not destroy encounter."
      redirect_to encounters_path
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
