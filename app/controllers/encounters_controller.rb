class EncountersController < ApplicationController
  def index
    @encounters = Encounter.all
  end

  def show
    encounter = Encounter.find(params[:id])
    @presenter = EncounterPresenter.new(encounter)
  end

  def new
    @encounter = Encounter.new
    @encounter_presenter = EncounterFormPresenter.new(@encounter)
  end

  def create
    @encounter = Encounter.new(encounter_params)

    if @encounter.save
      redirect_to encounters_path, notice: "Successfully saved encounter."
    else
      @encounter_presenter = EncounterFormPresenter.new(@encounter)
      flash[:error] = "There was a problem saving this encounter: #{@encounter.errors.messages}"
      render :new
    end
  end

  def edit
    @encounter = Encounter.find(params[:id])
    @encounter_presenter = EncounterFormPresenter.new(@encounter)
  end

  def update
    @encounter = Encounter.find(params[:id])

    if @encounter.update_attributes(encounter_params)
      flash[:notice] = "Successfully updated encounter."
      redirect_to encounters_path
    else
      @encounter_presenter = EncounterPresenter.new(@encounter)
      flash[:error] = "There was a problem updating this encounter"
      render :edit
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
    params.require(:encounter).permit(:category_id, :description)
  end
end
