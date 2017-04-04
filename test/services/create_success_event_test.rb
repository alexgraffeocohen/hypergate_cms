require 'test_helper'

class CreateSuccessEventTest < ActiveSupport::TestCase
  def setup
    @encounter = encounters(:ai_planet)
    @success_event = Event.new(
      description: "We were victorious!",
      encounter: @encounter
    )
  end

  test "associates event as option success event" do
    option = Option.new(
      text: "Re-program the robots",
      order: 3,
      event: @encounter.starting_event
    )
    option.save

    subject = CreateSuccessEvent.new(event: @success_event, option: option)

    assert(subject.save)
    assert_equal(option.success_event, @success_event)
  end

  test "fails if option already has a success event" do
    option = options(:fight_the_ai)
    subject = CreateSuccessEvent.new(event: @success_event, option: option)

    assert_not(subject.save)

    error_message = @success_event.errors.full_messages.first[:message]

    assert_includes(error_message, "This Option already has a Success Event.")
  end
end
