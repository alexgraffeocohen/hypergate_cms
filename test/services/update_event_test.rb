require 'test_helper'

class UpdateEventTest < ActiveSupport::TestCase
  test "will not associate empty role responses" do
    event = events(:population_is_nice)
    attributes = {
      responses_attributes: {
        "0" => { role_id: 1, text: '' },
        "1" => { role_id: 2, text: nil }
      }
    }

    subject = UpdateEvent.new(event, attributes)

    assert(subject.save)
    assert(event.responses.empty?)
  end

  test "will associate valid role responses" do
    event = events(:population_is_nice)
    attributes = {
      responses_attributes: {
        "0" => { role_id: roles(:engineer).id, text: 'Whoa!' }
      }
    }

    subject = UpdateEvent.new(event, attributes)

    assert(subject.save)
    assert_equal(1, event.responses.count)
    assert_equal('Whoa!', event.responses.first.text)
  end

  test "will update existing event results" do
    event = events(:cannot_defeat_the_ai)
    expected_amount = 3
    existing_result = event.
      event_results.
      find { |er|
        er.ship_effect == ship_effects(:crew_sanity)
      }
    attributes = {
      event_results_attributes: {
        "0" => {
          ship_effect_id: ship_effects(:crew_sanity).id,
          amount: expected_amount
        }
      }
    }

    assert(existing_result, "Expected event fixture to have a crew sanity result")
    assert_not_equal(expected_amount, existing_result.amount, "Expected crew sanity result to not have an amount of 0.")

    subject = UpdateEvent.new(event, attributes)

    assert(subject.save, "Expected service to save.")

    existing_result.reload

    assert_equal(
      expected_amount,
      existing_result.amount
    )
  end

  test "will not save with event result validation error" do
    event = events(:cannot_defeat_the_ai)
    expected_amount = 4
    attributes = {
      event_results_attributes: {
        "0" => {
          ship_effect_id: ship_effects(:crew_sanity).id,
          amount: expected_amount
        }
      }
    }

    subject = UpdateEvent.new(event, attributes)

    assert_not(subject.save, "Expected service not to save.")

    existing_result = event.
      event_results.
      find { |er|
        er.ship_effect == ship_effects(:crew_sanity)
      }

    assert_equal(
      expected_amount,
      existing_result.amount,
      "Expected existing result to have invalid amount"
    )
  end
end
