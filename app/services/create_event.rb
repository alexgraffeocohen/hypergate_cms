class CreateEvent
  def initialize(event:, encounter:)
    @event = event
    @encounter = encounter
  end

  def save
    prepare_event_for_save
    return false if !event.save

    if encounter.events.count == 1
      return false if !encounter.update_attribute(
        :starting_event_id, event.id
      )
    end

    true
  end

  private

  attr_reader :event, :encounter

  def prepare_event_for_save
    event.encounter = encounter
    role_responses = event.responses
    valid_responses = role_responses.reject { |role_response|
      role_response.text.blank?
    }
    event.responses = valid_responses
  end
end
