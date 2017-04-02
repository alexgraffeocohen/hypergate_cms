require 'test_helper'

class EncounterFlowTest < ActionDispatch::IntegrationTest
  test "creating first event of an encounter" do
    encounter = encounters(:no_events)

    get "/encounters/#{encounter.id}/events/new"
    assert_response :success

    post "/encounters/#{encounter.id}/events",
      { event: { description: "test" } }

    encounter.reload
    starting_event = encounter.starting_event

    assert_equal(starting_event.description, "test")
  end
end
