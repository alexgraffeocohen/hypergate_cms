require 'test_helper'

class OptionFlowTest < ActionDispatch::IntegrationTest
  test "creating option on an event" do
    encounter = encounters(:ai_planet)
    event = encounter.starting_event

    get "/encounters/#{encounter.id}/events/#{event.id}/options/new"
    assert_response :success

    post "/encounters/#{encounter.id}/events/#{event.id}/options",
      { option: { text: "test", order: 1 } }

    event.reload
    assert_includes(event.options.pluck(:text), "test")
  end
end
