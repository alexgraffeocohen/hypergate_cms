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
end
