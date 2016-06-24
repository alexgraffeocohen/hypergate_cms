class EncountersController < ApplicationController
  def index
    @encounters = Encounter.all
  end
end
