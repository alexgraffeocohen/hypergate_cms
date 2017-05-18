require 'test_helper'

class ApiV1EncounterTest < ActionDispatch::IntegrationTest
  def setup
    @published_encounter = encounters(:ai_planet)
    @published_encounter.published = true
    @published_encounter.save

    get "/api/v1/encounters/"
    assert_response :success

    @encounters = JSON.parse(@response.body)
  end

  test "only published encounters returned" do
    unpublished_encounter = encounters(:no_events)

    published_encounter_in_response = @encounters.
      any? { |attributes|
      attributes["id"] == @published_encounter.id
    }
    unpublished_encounter_in_response = @encounters.
      any? { |attributes|
      attributes["id"] == unpublished_encounter.id
    }

    assert(published_encounter_in_response)
    assert_not(unpublished_encounter_in_response)
  end
end
