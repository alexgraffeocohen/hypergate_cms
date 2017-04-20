require 'test_helper'

class CreateFailureEventTest < ActiveSupport::TestCase
  def setup
    @encounter = encounters(:ai_planet)
    @failure_event = Event.new(
      description: "We were victorious!",
      encounter: @encounter
    )
    @option = Option.new(
      text: "Re-program the robots",
      order: 3,
      event: @encounter.starting_event
    )
    @option.save
  end

  test "associates event as option failure event" do
    subject = CreateFailureEvent.new(event: @failure_event, option: @option)

    assert(subject.save)
    assert_equal(@option.failure_event, @failure_event)
  end

  test "fails if option already has a failure event" do
    option = options(:fight_the_ai)
    subject = CreateFailureEvent.new(event: @failure_event, option: option)

    assert_not(subject.save)

    error_message = @failure_event.errors.full_messages.first[:message]

    assert_includes(error_message, "This Option already has a Failure Event.")
  end

  test "will remove empty role responses" do
    @failure_event.responses = [
      Response.new(
        text: nil,
        role: roles(:engineer),
        event: @failure_event
      ),
      Response.new(
        text: '',
        role: roles(:pilot),
        event: @failure_event
      )
    ]

    subject = CreateSuccessEvent.new(event: @failure_event, option: @option)

    assert(subject.save)
    assert(@failure_event.responses.empty?)
  end

  test "will keep valid role responses" do
    @failure_event.responses = [
      Response.new(
        text: "Holy smokes, captain!",
        role: roles(:engineer),
        event: @failure_event
      )
    ]

    subject = CreateSuccessEvent.new(event: @failure_event, option: @option)

    assert(subject.save)
    assert_equal(1, @failure_event.responses.count)
  end
end
