module Api
  module V1
    class EncountersController < ApplicationController
      def index
        @encounters = Encounter.published.standalone
        render json: @encounters, include: '**'
      end
    end
  end
end
