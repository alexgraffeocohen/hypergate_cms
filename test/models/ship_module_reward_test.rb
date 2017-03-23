require 'test_helper'

class ShipModuleRewardTest < ActiveSupport::TestCase
  test "associations work" do
    event = events(:land_on_ai_planet)
    ship_module = ship_modules(:med_bay)
    subject = ShipModuleReward.new(
      event: event,
      ship_module: ship_module
    )
    subject.save

    assert subject.valid?
    assert_equal event, subject.event
    assert_equal ship_module, subject.ship_module

    assert event.ship_modules.include?(ship_module)
    assert ship_module.events.include?(event)
  end
end
