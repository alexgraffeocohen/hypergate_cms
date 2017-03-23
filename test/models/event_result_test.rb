require 'test_helper'

class EventResultTest < ActiveSupport::TestCase
  test "associations work" do
    event = events(:land_on_ai_planet)
    result = ship_effect_results(:hurt_crew_sanity)
    subject = EventResult.new(
      event: event,
      ship_effect_result: result
    )
    subject.save

    assert subject.valid?
    assert_equal event, subject.event
    assert_equal result, subject.ship_effect_result

    assert event.ship_effect_results.include?(result)
    assert result.events.include?(event)
  end
end
