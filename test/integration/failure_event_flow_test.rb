require 'test_helper'

class FailureEventFlowTest < ActionDispatch::IntegrationTest
  test "can add a failure event" do
    encounter = encounters(:ai_planet)
    event = encounter.starting_event
    option = Option.new(
      text: "Re-program the robots",
      order: 3,
      event: event
    )
    option.save

    post "/encounters/#{encounter.id}/events/#{event.id}/options/#{option.id}/failure_events",
      { event: { description: "test" } }
    option.reload

    assert_equal(option.failure_event.description, "test")
  end
end
