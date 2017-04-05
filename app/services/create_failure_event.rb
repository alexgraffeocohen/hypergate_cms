class CreateFailureEvent
  def initialize(event:, option:)
    @event = event
    @option = option
  end

  def save
    if option.failure_event
      event.errors.add(:base, message: "This Option already has a Failure Event.")
      return false
    end

    return false if !event.save
    return false if !option.update_attribute(:failure_event_id, event.id)

    true
  end

  private

  attr_reader :event, :option
end
