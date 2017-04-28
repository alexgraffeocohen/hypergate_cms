class UpdateEvent
  def initialize(event, attributes)
    @event = event
    @attributes = attributes
  end

  def save
    Event.transaction do
      prepare_event_for_update

      if !event.update_attributes(attributes)
        raise ActiveRecord::Rollback
      end
    end

    event.valid?
  end

  private

  attr_reader :event, :attributes

  def prepare_event_for_update
    clear_existing_responses
    @event_results = update_existing_event_results
    reject_invalid_responses

    event.event_results = @event_results if @event_results
  end

  def clear_existing_responses
    # Existing resposnes are in params because the presenter put them in the
    # form. This is the easiest way to make sure we don't have too many
    # responses on the event.

    @current_responses = event.responses
    event.responses.destroy_all
  end

  def update_existing_event_results
    event_result_attributes = attributes.delete(:event_results_attributes)

    return if !event_result_attributes

    event_result_attributes.map do |index, attributes|
      ship_effect_id = attributes[:ship_effect_id]
      amount = attributes[:amount]
      event_result = event.
        event_results.
        find_by(ship_effect_id: ship_effect_id)

      event_result.update_attributes(amount: amount)
      event_result
    end
  end

  def reject_invalid_responses
    role_responses = attributes.delete(:responses_attributes)

    return if !role_responses

    valid_responses = role_responses.reject { |index|
      role_responses[index][:text].blank?
    }
    attributes[:responses_attributes] = valid_responses
  end
end
