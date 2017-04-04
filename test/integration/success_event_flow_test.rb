require 'test_helper'

class SuccessEventFlowTest < ActionDispatch::IntegrationTest
  test "can add a success event" do
    encounter = encounters(:ai_planet)
    event = encounter.starting_event
    option = Option.new(
      text: "Re-program the robots",
      order: 3,
      event: event
    )
    option.save

    post "/encounters/#{encounter.id}/events/#{event.id}/options/#{option.id}/success_events",
      { event: { description: "test" } }
    option.reload

    assert_equal(option.success_event.description, "test")
  end
end
