require 'test_helper'

class OptionTest < ActiveSupport::TestCase
  def setup
    @encounter = encounters(:ai_planet)
    @event = Event.new(
      encounter: @encounter,
      description: "an event"
    )
    @option = Option.new(
      event: @event,
      text: "an option",
      order: 1
    )
  end

  test "success_event not required when not published" do
    assert(@option.valid?)
  end

  test "success_event required when published" do
    @encounter.published = true

    assert_not(@option.valid?)
  end

  test "valid when published with a success_event" do
    @encounter.published = true
    @option.success_event = Event.new(
      encounter: @encounter,
      description: 'success!'
    )

    assert(@option.valid?)
  end
end
