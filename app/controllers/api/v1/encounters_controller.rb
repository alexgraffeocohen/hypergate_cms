module Api
  module V1
    class EncountersController < ApplicationController
      def index
        @encounters = Encounter.published
        render json: @encounters
      end
    end
  end
end
