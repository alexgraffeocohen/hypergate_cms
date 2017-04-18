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

  test "will remove empty role responses" do
    encounter = encounters(:ai_planet)
    event = Event.new(description: "Test")
    event.responses = [
      Response.new(
        text: nil,
        role: roles(:engineer),
        event: event
      ),
      Response.new(
        text: '',
        role: roles(:pilot),
        event: event
      )
    ]

    subject = CreateEvent.new(event: event, encounter: encounter)

    assert(subject.save)
    assert(event.responses.empty?)
  end

  test "will keep valid role responses" do
    encounter = encounters(:ai_planet)
    event = Event.new(description: "Test")
    event.responses = [
      Response.new(
        text: "Holy smokes, captain!",
        role: roles(:engineer),
        event: event
      )
    ]

    subject = CreateEvent.new(event: event, encounter: encounter)

    assert(subject.save)
    assert_equal(1, event.responses.count)
  end
end
