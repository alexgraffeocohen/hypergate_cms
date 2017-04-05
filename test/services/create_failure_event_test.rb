require 'test_helper'

class CreateFailureEventTest < ActiveSupport::TestCase
  def setup
    @encounter = encounters(:ai_planet)
    @failure_event = Event.new(
      description: "We were victorious!",
      encounter: @encounter
    )
  end

  test "associates event as option failure event" do
    option = Option.new(
      text: "Re-program the robots",
      order: 3,
      event: @encounter.starting_event
    )
    option.save

    subject = CreateFailureEvent.new(event: @failure_event, option: option)

    assert(subject.save)
    assert_equal(option.failure_event, @failure_event)
  end

  test "fails if option already has a failure event" do
    option = options(:fight_the_ai)
    subject = CreateFailureEvent.new(event: @failure_event, option: option)

    assert_not(subject.save)

    error_message = @failure_event.errors.full_messages.first[:message]

    assert_includes(error_message, "This Option already has a Failure Event.")
  end
end
