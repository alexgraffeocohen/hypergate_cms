require 'test_helper'

class ItemRewardTest < ActiveSupport::TestCase
  test "associations work" do
    event = events(:land_on_ai_planet)
    item = items(:laser_sword)
    subject = ItemReward.new(
      event: event,
      item: item
    )
    subject.save

    assert subject.valid?
    assert_equal event, subject.event
    assert_equal item, subject.item

    assert event.items.include?(item)
    assert item.events.include?(event)
  end
end
