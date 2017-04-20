require 'test_helper'

class EncounterFlowTest < ActionDispatch::IntegrationTest
  test "creating first event of an encounter" do
    encounter = encounters(:no_events)

    get "/encounters/#{encounter.id}/events/new"
    assert_response :success

    post "/encounters/#{encounter.id}/events",
      { event: { description: "test" } }
    assert_redirected_to encounter

    encounter.reload
    starting_event = encounter.starting_event

    assert_equal(starting_event.description, "test")
  end

  test "adding an event with role responses" do
    encounter = encounters(:ai_planet)
    role = roles(:engineer)
    role_text = "That was crazy!"

    post "/encounters/#{encounter.id}/events",
      { event: { description: "test", responses_attributes: { "0" => {role_id: role.id, text: role_text}}}}
    assert_redirected_to encounter

    event = Event.where(description: "test").last
    response = event.responses.last

    assert_equal(response.text, role_text)
  end

  test "updating an event with role responses" do
    event = events(:land_on_ai_planet)
    role = roles(:engineer)
    role_text = "That was crazy!"

    # Prove that the event already has an engineer role response with different
    # text.
    assert_equal(event.responses.last.role, role)
    assert_not_equal(event.responses.last.text, role_text)

    patch "/encounters/#{event.encounter.id}/events/#{event.id}",
      { event: { responses_attributes: { "0" => {role_id: role.id, text: role_text}}}}
    assert_redirected_to event.encounter

    event.reload

    assert_equal(event.responses.last.role, role)
    assert_equal(event.responses.last.text, role_text)
  end
end
