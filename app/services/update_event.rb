class UpdateEvent
  def initialize(event, attributes)
    @event = event
    @attributes = attributes
  end

  def save
    prepare_event_for_update

    event.update_attributes(attributes)
  end

  private

  attr_reader :event, :attributes

  def prepare_event_for_update
    clear_existing_responses
    reject_invalid_responses
  end

  def clear_existing_responses
    # Existing resposnes are in params because the presenter put them in the
    # form. This is the easiest way to make sure we don't have too many
    # responses on the event.

    @current_responses = event.responses
    event.responses.destroy_all
  end

  def reject_invalid_responses
    role_responses = attributes.delete(:responses_attributes)
    valid_responses = role_responses.reject { |index|
      role_responses[index][:text].blank?
    }
    attributes[:responses_attributes] = valid_responses
  end
end
