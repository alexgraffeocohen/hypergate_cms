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

  test "adding an event with roles" do
    encounter = encounters(:ai_planet)
    role = roles(:engineer)
    role_text = "That was crazy!"

    post "/encounters/#{encounter.id}/events",
      { event: { description: "test", responses_attributes: [{role_id: role.id, text: role_text}] }  }
    assert_redirected_to encounter

    event = Event.where(description: "test").last
    response = event.responses.last

    assert_equal(response.text, role_text)
  end
end
