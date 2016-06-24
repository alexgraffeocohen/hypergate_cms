class EncountersController < ApplicationController
  def index
    @encounters = Encounter.all
  end

  def new
    @encounter = Encounter.new
    @encounter_presenter = NewEncounterPresenter.new(@encounter)
  end
end
