require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "Event#destroy when it is not a starting event" do
    encounter = encounters(:ai_planet)
    event = Event.new(
      description: "test",
      encounter: encounter
    )

    event.destroy

    assert_equal(1, Encounter.where(id: encounter.id).count)
  end

  # TODO: this test is failing right now
  # test "Event#destroy when it is a starting event" do
  #   encounter = encounters(:ai_planet)
  #   event = encounter.starting_event

  #   byebug
  #   event.destroy
  #   byebug

  #   assert_equal(1, Encounter.where(id: encounter.id).count)
  # end
end
