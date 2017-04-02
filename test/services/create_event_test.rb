require 'test_helper'

class CreateEventTest < ActiveSupport::TestCase
  test "associates event with passed encounter" do
    encounter = encounters(:ai_planet)
    event = Event.new(description: "Test")
    subject = CreateEvent.new(event: event, encounter: encounter)

    assert(subject.save)
    assert_includes(encounter.events, event)
  end

  test "will set starting_event on encounter" do
    encounter = encounters(:no_events)
    event = Event.new(description: "Test")
    subject = CreateEvent.new(event: event, encounter: encounter)

    assert(subject.save)
    assert_equal(encounter.starting_event, event)
  end
end
